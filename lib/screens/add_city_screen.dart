// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:newproject/services/weather.dart';
import 'package:newproject/models/city_data.dart';

class AddCityScreen extends StatelessWidget {
  const AddCityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String newCityTitle = "";

    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add City',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.yellow.shade600,
              ),
            ),
            TextField(
              autofocus: true,
              cursorColor: Colors.yellow.shade600,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newCityTitle = newText;
              },
            ),
            TextButton(
              child: const Text(
                'Add',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),

              // Async method to implement the get request and write the data for
              // weatherIcon and weatherMap and pass it with Provider to the CityData
              // class and Update UI based on the new city.
              onPressed: () async {
                var weatherData =
                    await WeatherModel().getCityWeather(newCityTitle);
                var condition = weatherData['weather'][0]['id'];

                String weatherIcon = WeatherModel().getWeatherIcon(condition);
                String weatherTemp =
                    "${weatherData['main']['temp'].toString()} °C";

                Provider.of<CityData>(context, listen: false)
                    .addCity(newCityTitle, weatherIcon, weatherTemp);

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
