import 'package:bloc_weather_app/Repos/WeaterRepo/current_locationWeaterRepo.dart';
import 'package:bloc_weather_app/Repos/WeaterRepo/weatherRepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'BLocs/Weather/bloc/weather_bloc.dart';
import 'Presentation/views/HomePage/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BLoc Weather',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.grey[900],
          body: BlocProvider(
            create: (context) => WeatherBloc(
                weatherRepo: WeatherRepo(),
                currentLocationWeaterReop: CurrentLocationWeaterReop()),
            child: SearchPage(),
          ),
        ));
  }
}
