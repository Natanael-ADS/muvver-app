import 'package:muvver_app/modules/route/domain/unities/city.dart';

abstract class SearchCityRepository {
  Future<List<City>> searchText(String text);
}
