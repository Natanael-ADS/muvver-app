import 'package:muvver_app/modules/core/error/log_error.dart';
import 'package:muvver_app/modules/route/domain/repositories/search_city_repository.dart';
import 'package:muvver_app/modules/route/domain/unities/city.dart';
import 'package:muvver_app/modules/route/infra/datasources/search_city_datasource.dart';

class SearchCityRepositoryImpl implements SearchCityRepository {
  final SearchCityDatasource datasource;

  SearchCityRepositoryImpl(this.datasource);
  @override
  Future<List<City>> searchText(String text) async {
    List<City> cities;
    try {
      final models = await datasource.searchText(text);
      cities = models;
    } catch (exception, stackTrace) {
      LogError(exception, stackTrace);
      cities = [];
    }
    return cities;
  }
}
