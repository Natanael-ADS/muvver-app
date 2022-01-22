import 'package:muvver_app/modules/traveler/domain/unities/traveler.dart';

class TravelerModel extends Traveler {
  TravelerModel({
    required int id,
    required int idUser,
    required int idTransport,
  }) : super(id: id, idUser: idUser, idTransport: idTransport);

  TravelerModel.fromUnity(Traveler traveler)
      : super(
          id: traveler.id,
          idUser: traveler.idUser,
          idTransport: traveler.idTransport,
        );
}
