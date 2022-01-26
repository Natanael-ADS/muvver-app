class City {
  final String id;
  final String name;
  final String stateAbbreviation;
  double latitude;
  double longitude;

  City({
    required this.id,
    required this.name,
    required this.stateAbbreviation,
    this.latitude = 0,
    this.longitude = 0,
  });

  String cityAndState() => name + " - " + stateAbbreviation;
}
