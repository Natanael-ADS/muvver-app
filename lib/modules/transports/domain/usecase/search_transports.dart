import 'package:muvver_app/modules/core/error/log_error.dart';
import 'package:muvver_app/modules/transports/domain/repositories/search_transports_repository.dart';
import 'package:muvver_app/modules/transports/domain/unities/transport.dart';

abstract class SearchTransports {
  Future<List<Transport>> call();
}

class SearchTransportsImpl implements SearchTransports {
  final SearchTransportsRepository repository;

  SearchTransportsImpl(this.repository);

  @override
  Future<List<Transport>> call() async {
    List<Transport> transports;
    try {
      transports = await repository.search();
    } catch (e, s) {
      LogError(e, s);
      transports = <Transport>[];
    }
    return transports;
  }
}
