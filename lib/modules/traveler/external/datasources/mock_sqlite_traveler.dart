import 'package:muvver_app/modules/core/error/log_error.dart';
import 'package:muvver_app/modules/core/external/data/mock_sqlite.dart';
import 'package:muvver_app/modules/traveler/infra/datasources/add_travaler_datasource.dart';
import 'package:muvver_app/modules/traveler/infra/models/traveler_model.dart';

class MockSQLiteTraveler implements AddTravelerDatasource {
  final MockSQLite database;

  MockSQLiteTraveler(this.database);

  @override
  void add(TravelerModel traveler) {
    try {
      database.travelers.add(traveler);
    } catch (exception, stackTrace) {
      LogError(exception, stackTrace);
    }
  }
}
