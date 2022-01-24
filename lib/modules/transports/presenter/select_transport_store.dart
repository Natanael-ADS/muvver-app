import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:muvver_app/modules/core/constant/route_const.dart';
import 'package:muvver_app/modules/core/constant/user_const.dart';
import 'package:muvver_app/modules/route/domain/usecase/search_city.dart';
import 'package:muvver_app/modules/transports/domain/unities/transport.dart';
import 'package:muvver_app/modules/transports/domain/usecase/search_transports.dart';
import 'package:muvver_app/modules/traveler/domain/unities/traveler.dart';
import 'package:muvver_app/modules/traveler/domain/usecases/add_traveler.dart';
part 'select_transport_store.g.dart';

class SelectTransportStore = _SelectTransportStoreBase
    with _$SelectTransportStore;

abstract class _SelectTransportStoreBase with Store {
  final search = Modular.get<SearchTransportsImpl>();
  final add = Modular.get<AddTravelerImpl>();

  List<Transport> transports = [];

  @observable
  int valueRadio = 1;

  @action
  void setValueRadio(value) => valueRadio = value;

  Future<void> getTransports() async => transports = await search();

  void addTraveler() {
    final traveler = Traveler(idUser: UserConst.id, idTransport: valueRadio);
    add(traveler);

    Modular.to.pushNamed(RouteConst.TRIP + "/1");
  }
}
