import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:muvver_app/modules/route/domain/usecase/search_city.dart';
import 'package:muvver_app/modules/route/external/datasource/search_city_service.dart';
import 'package:muvver_app/modules/route/infra/repositories/search_city_repository_impl.dart';
import 'package:muvver_app/modules/route/presenter/main/trip_widget.dart';
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
      Bind.factory<Dio>((i) => Dio()),
      Bind.factory((i) => MockSQLiteTransport(i())),
      Bind.factory((i) => SearchTransportsResitoryImpl(i())),
      Bind.factory((i) => SearchTransportsImpl(i())),
      Bind.factory((i) => MockSQLiteTraveler(i())),
      Bind.factory((i) => AddTravelerRepositoryImpl(i())),
      Bind.factory((i) => AddTravelerImpl(i())),
      Bind.factory((i) => SearchCityService(i())),
      Bind.factory((i) => SearchCityRepositoryImpl(i())),
      Bind.factory((i) => SearchCityImpl(i()))
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(RouteConst.HOME, child: (c, a) => const HomeWidget()),
      ChildRoute(RouteConst.SELECT_TRANSPORT, child: (c, a) {
        return const SelectTransportWidget();
      }),
      ChildRoute(RouteConst.TRIP + "/:id", child: (c, a) {
        return TripWidget(idTraveler: int.parse(a.params['id'].toString()));
      }),
    ];
  }
}
