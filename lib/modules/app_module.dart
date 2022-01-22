import 'package:flutter_modular/flutter_modular.dart';
import 'package:muvver_app/modules/transports/domain/usecase/search_transports.dart';
import 'package:muvver_app/modules/transports/external/datasources/mock_sqlite_transport.dart';
import 'package:muvver_app/modules/transports/infra/repositories/search_transports_repository_impl.dart';
import 'package:muvver_app/modules/traveler/domain/usecases/add_traveler.dart';
import 'package:muvver_app/modules/traveler/external/datasources/mock_sqlite_traveler.dart';
import 'package:muvver_app/modules/traveler/infra/repositories/add_traveler_repository_impl.dart';

import 'core/constant/route_const.dart';
import 'core/external/data/mock_sqlite.dart';
import 'home/home_widget.dart';
import 'transports/presenter/select_transport_widget.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind.singleton((i) => MockSQLite()),
      Bind.factory((i) => MockSQLiteTransport(i())),
      Bind.factory((i) => SearchTransportsResitoryImpl(i())),
      Bind.factory((i) => SearchTransportsImpl(i())),
      Bind.factory((i) => MockSQLiteTraveler(i())),
      Bind.factory((i) => AddTravelerRepositoryImpl(i())),
      Bind.factory((i) => AddTravelerImpl(i())),
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(RouterConst.HOME, child: (c, a) => const HomeWidget()),
      ChildRoute(RouterConst.SELECT_TRANSPORT, child: (c, a) {
        return SelectTransportWidget();
      }),
    ];
  }
}
