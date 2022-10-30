import 'package:flutter/foundation.dart';
import 'package:newproject/models/city.dart';
import 'dart:collection';

class CityData extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<City> _cities = [];

  UnmodifiableListView<City> get cities {
    return UnmodifiableListView(_cities);
  }

  int get cityCount {
    return _cities.length;
  }

  void addCity(String newCityTitle, String weatherIcon, String weatherTemp) {
    final city = City(
        name: newCityTitle, weatherIcon: weatherIcon, weatherTemp: weatherTemp);
    _cities.add(city);
    notifyListeners();
  }
}
