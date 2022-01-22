import 'package:muvver_app/modules/traveler/domain/unities/traveler.dart';

class TravelerModel extends Traveler {
  TravelerModel({
    required int id,
    required int idUser,
    required int idTransport,
  }) : super(id: id, idUser: idUser, idTransports: idTransport);
}
