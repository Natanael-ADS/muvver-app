import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:muvver_app/modules/route/domain/unities/city.dart';
import 'package:muvver_app/modules/route/infra/datasources/search_city_datasource.dart';
import 'package:muvver_app/modules/route/infra/models/city_model.dart';
import 'package:muvver_app/modules/route/infra/repositories/search_city_repository_impl.dart';

import 'search_city_repository_impl_test.mocks.dart';

@GenerateMocks([SearchCityDatasource])
void main() {
  final datasource = MockSearchCityDatasource();
  final repository = SearchCityRepositoryImpl(datasource);
  testWidgets('error - search city repository impl ...', (tester) async {
    when(datasource.searchText(any)).thenThrow(Exception());

    final actual = await repository.searchText("test");
    expect(actual, isA<List<City>>());
  });

  testWidgets('sucess - search city repository impl ...', (tester) async {
    when(datasource.searchText(any)).thenAnswer((realInvocation) async {
      return [CityModel(id: "test", name: "test", stateAbbreviation: "test")];
    });

    final actual = await repository.searchText("test");
    expect(actual, isA<List<City>>());
    expect(actual, isNotEmpty);
  });
}
