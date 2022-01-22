import 'package:muvver_app/modules/core/error/log_error.dart';
import 'package:muvver_app/modules/traveler/domain/repositories/add_traveler_repository.dart';
import 'package:muvver_app/modules/traveler/domain/unities/traveler.dart';

abstract class AddTraveler {
  void call(Traveler traveler);
}

class AddTravelerImpl extends AddTraveler {
  final AddTravelerRepository repository;

  AddTravelerImpl(this.repository);
  @override
  void call(Traveler traveler) {
    try {
      repository.add(traveler);
    } catch (exception, stackTrace) {
      LogError(exception, stackTrace);
    }
  }
}
