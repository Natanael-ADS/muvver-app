import 'package:muvver_app/modules/route/domain/unities/route.dart';

class Traveler {
  int id;
  int idUser;
  int idTransport;
  RouteProduct? route;

  Traveler({this.id = 0, required this.idUser, required this.idTransport});
}
