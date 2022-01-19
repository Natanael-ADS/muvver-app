import 'package:flutter_test/flutter_test.dart';
import 'package:muvver_app/modules/core/external/data/mock_database.dart';
import 'package:muvver_app/modules/transports/external/datasources/sqlite_transport.dart';
import 'package:muvver_app/modules/transports/infra/models/transport_model.dart';

void main() {
  final database = MockDatabase();
  final datasource = SQLiteTransport(database);
  testWidgets('success - sqlite transport ...', (tester) async {
    final actual = await datasource.searchAll();

    expect(actual, isA<List<TransportModel>>());
    expect(actual, isNotEmpty);
  });
}
