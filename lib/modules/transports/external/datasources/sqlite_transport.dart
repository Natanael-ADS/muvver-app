import 'package:muvver_app/modules/core/external/data/mock_database.dart';
import 'package:muvver_app/modules/transports/infra/datasources/search_transports_datasource.dart';
import 'package:muvver_app/modules/transports/infra/models/transport_model.dart';

class SQLiteTransport implements SearchTransportsDatasource {
  final MockDatabase database;

  SQLiteTransport(this.database);

  @override
  Future<List<TransportModel>> searchAll() async {
    return database.transports;
  }
}
