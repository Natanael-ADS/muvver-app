import 'city.dart';

class RouteProduct {
  DateTime departureDate;
  DateTime arrivalDate;
  City originCity;
  City destinationCity;
  List<City>? intermediatePoints;

  RouteProduct({
    required this.departureDate,
    required this.arrivalDate,
    required this.originCity,
    required this.destinationCity,
    this.intermediatePoints,
  });
}
