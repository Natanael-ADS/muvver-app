import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:muvver_app/modules/route/domain/repositories/search_city_repository.dart';
import 'package:muvver_app/modules/route/domain/unities/city.dart';
import 'package:muvver_app/modules/route/domain/usecase/search_city.dart';

import 'search_city_test.mocks.dart';

@GenerateMocks([SearchCityRepository])
void main() {
  final repository = MockSearchCityRepository();
  final usecase = SearchCityImpl(repository);
  testWidgets('error - search city ...', (tester) async {
    when(repository.searchText(any)).thenThrow(Exception());

    final actual = await usecase("palmas");

    expect(actual, isA<List<City>>());
  });

  testWidgets('success - search city ...', (tester) async {
    when(repository.searchText(any)).thenAnswer((realInvocation) async {
      return [City(id: "sdfaeg", name: "teste", stateAbbreviation: "te")];
    });

    final actual = await usecase("palmas");

    expect(actual, isA<List<City>>());
    expect(actual, isNotEmpty);
  });
}
