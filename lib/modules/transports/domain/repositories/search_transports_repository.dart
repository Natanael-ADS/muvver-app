import 'package:muvver_app/modules/transports/domain/unities/transport.dart';

abstract class SearchTransportsRepository {
  Future<List<Transport>> search();
}
