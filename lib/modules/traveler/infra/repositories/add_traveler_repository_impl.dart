import 'package:muvver_app/modules/core/error/log_error.dart';
import 'package:muvver_app/modules/transports/infra/models/transport_model.dart';
import 'package:muvver_app/modules/traveler/domain/repositories/add_traveler_repository.dart';
import 'package:muvver_app/modules/traveler/domain/unities/traveler.dart';
import 'package:muvver_app/modules/traveler/infra/datasources/add_travaler_datasource.dart';
import 'package:muvver_app/modules/traveler/infra/models/traveler_model.dart';

class AddTravelerRepositoryImpl implements AddTravelerRepository {
  final AddTravelerDatasource datasource;

  AddTravelerRepositoryImpl(this.datasource);
  @override
  void add(Traveler traveler) {
    try {
      final model = traveler as TravelerModel;
      datasource.add(model);
    } catch (exception, stackTrace) {
      LogError(exception, stackTrace);
    }
  }
}
