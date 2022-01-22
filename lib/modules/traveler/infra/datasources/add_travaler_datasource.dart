import 'package:muvver_app/modules/traveler/infra/models/traveler_model.dart';

abstract class AddTravelerDatasource {
  void add(TravelerModel traveler);
}
