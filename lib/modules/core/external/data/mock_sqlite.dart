import 'package:muvver_app/modules/core/external/data/mock_init_sqlite.dart';
import 'package:muvver_app/modules/transports/infra/models/transport_model.dart';
import 'package:muvver_app/modules/traveler/infra/models/traveler_model.dart';

class MockSQLite {
  List<TransportModel> transports = [];
  List<TravelerModel> travelers = [];

  MockSQLite() {
    transports = MockInitSQLite().transportModels;
  }
}
