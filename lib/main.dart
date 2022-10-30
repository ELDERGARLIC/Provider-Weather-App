// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:newproject/screens/cities_screen.dart';
import 'package:provider/provider.dart';
import 'package:newproject/models/city_data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ChangeNotifierProvider at the top point of widget tree.
    // Updates UI based on changes on the CityData model.
    return ChangeNotifierProvider(
      create: (context) => CityData(),
      child: MaterialApp(
        home: CitiesScreen(),
      ),
    );
  }
}
