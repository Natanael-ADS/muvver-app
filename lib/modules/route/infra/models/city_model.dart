import 'package:flutter/foundation.dart';
import 'package:muvver_app/modules/route/domain/unities/city.dart';

class CityModel extends City {
  CityModel({
    required String id,
    required String name,
    required stateAbbreviation,
    double longitude = 0,
    double latitude = 0,
  }) : super(
          id: id,
          name: name,
          stateAbbreviation: stateAbbreviation,
          latitude: latitude,
          longitude: longitude,
        );
}
