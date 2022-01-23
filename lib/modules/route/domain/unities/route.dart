import 'city.dart';

class Route {
  DateTime departureDate;
  DateTime arrivalDate;
  City originCity;
  City destinationCity;
  List<City> intermediatePoints;

  Route({
    required this.departureDate,
    required this.arrivalDate,
    required this.originCity,
    required this.destinationCity,
    required this.intermediatePoints,
  });
}
