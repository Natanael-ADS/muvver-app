import 'package:muvver_app/modules/transports/infra/models/transport_model.dart';

class MockDatabaseTransport {
  final models = [
    TransportModel(id: 1, name: "teste", pathImage: "teste.png"),
  ];
}
