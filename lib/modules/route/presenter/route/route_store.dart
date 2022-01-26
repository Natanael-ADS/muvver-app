import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:muvver_app/modules/core/util/datetime_util.dart';
import 'package:muvver_app/modules/route/domain/unities/city.dart';
import 'package:muvver_app/modules/route/domain/unities/route.dart';
import 'package:muvver_app/modules/route/domain/usecase/search_city.dart';
import 'package:muvver_app/modules/traveler/domain/unities/traveler.dart';
import 'package:muvver_app/modules/traveler/domain/usecases/add_traveler.dart';
part 'route_store.g.dart';

class RouteStore = _RouteStoreBase with _$RouteStore;

abstract class _RouteStoreBase with Store {
  final _addTraveler = Modular.get<AddTravelerImpl>();
  final searchCity = Modular.get<SearchCityImpl>();

  final TextEditingController dateBeginController = TextEditingController();
  final TextEditingController dateEndController = TextEditingController();

  final TextEditingController cityOriginController = TextEditingController();
  final TextEditingController cityDestinController = TextEditingController();

  City? cityOrigin;
  City? cityDestin;

  void nextWidget(Traveler traveler) {
    traveler.route = RouteProduct(
      departureDate: DatetimeUtil.strToDate(dateBeginController.text),
      arrivalDate: DatetimeUtil.strToDate(dateEndController.text),
      originCity: cityOrigin!,
      destinationCity: cityDestin!,
    );
    _addTraveler(traveler);
    //call next widget
  }

  void setDate(BuildContext context, TextEditingController controller) async {
    var date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2999),
    );
    controller.text = DatetimeUtil.getStringFromDate(date);
  }

  Future<List<City>> setCities(String text) {
    return searchCity(text);
  }
}
