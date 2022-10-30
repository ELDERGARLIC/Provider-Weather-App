import 'package:flutter/material.dart';

class CityTile extends StatelessWidget {
  final String cityTitle;
  final String weatherIcon;
  final String weatherTemp;

  const CityTile({
    super.key,
    required this.cityTitle,
    required this.weatherTemp,
    required this.weatherIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        weatherIcon,
      ),
      title: Text(
        cityTitle,
      ),
      trailing: Text(
        weatherTemp,
      ),
    );
  }
}
