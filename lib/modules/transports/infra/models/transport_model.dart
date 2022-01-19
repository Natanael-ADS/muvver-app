import 'package:muvver_app/modules/transports/domain/unities/transport.dart';

class TransportModel extends Transport {
  TransportModel({
    required int id,
    required String name,
    required String pathImage,
  }) : super(id: id, name: name, pathImage: pathImage);
}
