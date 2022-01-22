import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:muvver_app/modules/traveler/domain/unities/traveler.dart';
import 'package:muvver_app/modules/traveler/infra/datasources/add_travaler_datasource.dart';
import 'package:muvver_app/modules/traveler/infra/repositories/add_traveler_repository_impl.dart';

import 'add_traveler_repository_impl_test.mocks.dart';

@GenerateMocks([AddTravelerDatasource])
void main() {
  final datasource = MockAddTravelerDatasource();
  final repository = AddTravelerRepositoryImpl(datasource);
  testWidgets('error - add traveler repository impl ...', (tester) async {
    when(datasource.add(any)).thenThrow(Exception());

    repository.add(Traveler(idUser: 1, idTransports: 1));
  });

  testWidgets('Success - add traveler repository impl ...', (tester) async {
    repository.add(Traveler(idUser: 1, idTransports: 1));
  });
}
