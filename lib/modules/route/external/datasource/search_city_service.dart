import 'dart:convert';

import 'package:muvver_app/modules/core/error/log_error.dart';
import 'package:muvver_app/modules/core/util/google_api_util.dart';
import 'package:muvver_app/modules/route/infra/datasources/search_city_datasource.dart';
import 'package:muvver_app/modules/route/infra/models/city_model.dart';
import 'package:dio/dio.dart';

class SearchCityService implements SearchCityDatasource {
  final Dio http;

  SearchCityService(this.http);
  @override
  Future<List<CityModel>> searchText(String text) async {
    List<CityModel> models;
    try {
      var response = await http.get(GooglePlaceUtil.getUrlAutoComplete(text));

      models = _arrayJsonToModels(response);
    } catch (exception, stackTrace) {
      LogError(exception, stackTrace);
      models = [];
    }
    return models;
  }

  List<CityModel> _arrayJsonToModels(Response<dynamic> response) {
    final json = response.data;

    String idPlace, nameCity, nameState;
    List<CityModel> models = [];
    for (var prediction in json["predictions"]) {
      idPlace = prediction["place_id"];

      nameCity = prediction["terms"][0]["value"];
      nameState = prediction["terms"][1]["value"];

      models.add(CityModel(
        id: idPlace,
        name: nameCity,
        stateAbbreviation: nameState,
      ));
    }
    return models;
  }
}
