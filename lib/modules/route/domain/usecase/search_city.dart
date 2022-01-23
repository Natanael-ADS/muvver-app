import 'package:muvver_app/modules/core/error/log_error.dart';
import 'package:muvver_app/modules/route/domain/repositories/search_city_repository.dart';
import 'package:muvver_app/modules/route/domain/unities/city.dart';

abstract class SearchCity {
  Future<List<City>> call(String text);
}

class SearchCityImpl implements SearchCity {
  final SearchCityRepository repository;

  SearchCityImpl(this.repository);

  @override
  Future<List<City>> call(String text) async {
    List<City> cities;

    try {
      cities = await repository.searchText(text);
    } catch (exception, stackTrace) {
      LogError(exception, stackTrace);
      cities = [];
    }
    return cities;
  }
}
