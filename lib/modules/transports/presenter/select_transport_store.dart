import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:muvver_app/modules/transports/domain/unities/transport.dart';
import 'package:muvver_app/modules/transports/domain/usecase/search_transports.dart';
part 'select_transport_store.g.dart';

class SelectTransportStore = _SelectTransportStoreBase
    with _$SelectTransportStore;

abstract class _SelectTransportStoreBase with Store {
  late SearchTransportsImpl search;
  List<Transport> transports = [];
  @observable
  int valueRadio = 1;

  _SelectTransportStoreBase() {
    search = Modular.get<SearchTransportsImpl>();
  }

  @action
  void setValueRadio(value) => valueRadio = value;

  Future<void> getTransports() async => transports = await search();
}
