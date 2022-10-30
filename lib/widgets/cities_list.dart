import 'package:flutter/material.dart';
import 'package:newproject/widgets/city_tile.dart';
import 'package:provider/provider.dart';
import 'package:newproject/models/city_data.dart';

class CitiesList extends StatelessWidget {
  const CitiesList({super.key});

  @override
  Widget build(BuildContext context) {
    // Using Provider.of to get the latest CityData and update UI.
    final CityData cityData = Provider.of<CityData>(context);
    // ListView.builder to use less resources to render only items on the screen.
    return ListView.builder(
      itemBuilder: (context, index) {
        return CityTile(
          cityTitle: cityData.cities[index].name,
          weatherIcon: cityData.cities[index].weatherIcon,
          weatherTemp: cityData.cities[index].weatherTemp,
        );
      },
      itemCount: cityData.cityCount,
    );
  }
}
