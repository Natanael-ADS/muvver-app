import 'package:muvver_app/modules/core/error/log_error.dart';
import 'package:muvver_app/modules/transports/domain/repositories/search_transports_repository.dart';
import 'package:muvver_app/modules/transports/domain/unities/transport.dart';
import 'package:muvver_app/modules/transports/infra/sources/search_transports_datasource.dart';

class SearchTransportsResitoryImpl extends SearchTransportsRepository {
  final SearchTransportsDatasource datasource;

  SearchTransportsResitoryImpl(this.datasource);

  @override
  Future<List<Transport>> search() async {
    List<Transport> transports;
    try {
      transports = await datasource.searchAll();
    } catch (e, s) {
      LogError(e, s);
      transports = [];
    }
    return transports;
  }
}
