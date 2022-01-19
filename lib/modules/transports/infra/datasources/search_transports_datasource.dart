import 'package:muvver_app/modules/transports/infra/models/transport_model.dart';

abstract class SearchTransportsDatasource {
  Future<List<TransportModel>> searchAll();
}
