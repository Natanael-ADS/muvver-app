import 'package:flutter_modular/flutter_modular.dart';
import 'package:muvver_app/modules/home/home_widget.dart';
import 'package:muvver_app/modules/transports/domain/usecase/search_transports.dart';
import 'package:muvver_app/modules/transports/external/datasources/sqlite_transport.dart';
import 'package:muvver_app/modules/transports/infra/repositories/search_transports_repository_impl.dart';

import 'core/external/data/mock_database.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind.singleton((i) => MockDatabase()),
      Bind.factory((i) => SQLiteTransport(i())),
      Bind.factory((i) => SearchTransportsResitoryImpl(i())),
      Bind.factory((i) => SearchTransportsImpl(i())),
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [ChildRoute("/", child: (c, a) => const HomeWidget())];
  }
}
