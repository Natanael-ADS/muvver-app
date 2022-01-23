import 'package:muvver_app/modules/route/infra/models/city_model.dart';

abstract class SearchCityDatasource {
  Future<List<CityModel>> searchText(String text);
}
