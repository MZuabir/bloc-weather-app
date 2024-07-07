import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../BLocs/Weather/bloc/weather_bloc.dart';
import '../../../Models/weatherModel/WeaterModel.dart';

class ShowWeather extends StatelessWidget {
  WeatherModel weather;
  final city;

  ShowWeather(this.weather, this.city);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(right: 32, left: 32, top: 10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    weather.cityName,
                    style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Image.network(
                    'http://openweathermap.org/img/w/${weather.weatherIcon}.png'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${weather.getTemp.round()}C",
              style: const TextStyle(color: Colors.white70, fontSize: 50),
            ),
            const Text(
              "Temprature",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "${weather.getMinTemp.round()}C",
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 30),
                    ),
                    const Text(
                      "Min Temprature",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "${weather.getMaxTemp.round()}C",
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 30),
                    ),
                    const Text(
                      "Max Temprature",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Weather Description: ",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  weather.weatherDescription,
                  style: const TextStyle(color: Colors.white70, fontSize: 15),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<WeatherBloc>(context).add(ResetWeather());
                },
                child: const Text(
                  "Search Again",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<WeatherBloc>(context).add(ResetWeather());
                    },
                    child: const Text('Go Back',
                        style: TextStyle(color: Colors.white70, fontSize: 16))),
              ),
            ),
          ],
        ));
  }
}
