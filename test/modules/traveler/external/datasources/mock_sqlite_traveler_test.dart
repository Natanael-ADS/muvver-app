import 'package:flutter_test/flutter_test.dart';
import 'package:muvver_app/modules/core/external/data/mock_sqlite.dart';
import 'package:muvver_app/modules/traveler/external/datasources/mock_sqlite_traveler.dart';
import 'package:muvver_app/modules/traveler/infra/models/traveler_model.dart';

void main() {
  testWidgets('success - mock sqlite traveler ...', (tester) async {
    final database = MockSQLite();

    final datasource = MockSQLiteTraveler(database);

    datasource.add(TravelerModel(id: 1, idUser: 1, idTransport: 1));
  });
}
