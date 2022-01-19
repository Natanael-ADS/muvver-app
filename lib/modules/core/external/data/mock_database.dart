import 'package:muvver_app/modules/core/external/data/mock_database_transport.dart';
import 'package:muvver_app/modules/transports/infra/models/transport_model.dart';

class MockDatabase {
  List<TransportModel> transports = [];

  MockDatabase() {
    transports = MockDatabaseTransport().models;
  }
}
