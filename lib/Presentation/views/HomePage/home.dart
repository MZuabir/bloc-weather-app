import 'package:bloc_weather_app/Presentation/views/HomePage/show_weather_widget.dart';
import 'package:bloc_weather_app/Repos/Get_location/get_location.dart';
import 'package:bloc_weather_app/Repos/LocationPermission/location_permission.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_city_picker/city_picker.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../../BLocs/Weather/bloc/weather_bloc.dart';
import '../../../BLocs/Weather/bloc/weather_state.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var cityController = TextEditingController();
  String country = '';
  String? city = '';

  late double lat;
  late double long;

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherIsNotSearched) {
              return Container(
                padding: const EdgeInsets.only(
                  left: 32,
                  right: 32,
                ),
                child: Column(
                  children: <Widget>[
                    const Text(
                      "Search Weather",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                          color: Colors.white70),
                    ),
                    const Text(
                      "Instanly",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w200,
                          color: Colors.white70),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CSCPicker(
                      onCountryChanged: (value) {
                        country = value;
                      },
                      onCityChanged: (value) {
                        city = value;
                      },
                      onStateChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox( 
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          weatherBloc.add(FetchWeather(city?.toLowerCase()));
                        },
                        child: const Text(
                          "Search",
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'OR',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w200,
                          color: Colors.white70),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          GetLocation location = GetLocation();
                          location.getCurrentLocation().then((value) async {
                            lat = value.latitude;
                            long = value.longitude;

                            weatherBloc
                                .add(FetchWeaterCurrentLocation(lat, long));
                          });
                        },
                        child: const Text(
                          "Search Weather By Current Location",
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is WeatherIsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is WeatherIsLoaded) {
              return ShowWeather(state.getWeather, cityController.text);
            } else if (state is WeatherIsNotLoaded) {
              return Center(
                child: Column(
                  children: [
                    const Text(
                      'Something went wrong',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              weatherBloc.add(ResetWeather());
                            },
                            child: const Text('Try Another',
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 16))),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text(
                  "Error",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
          },
        )
      ],
    );
  }
}



// TextFormField(
                    //   controller: cityController,
                    //   decoration: const InputDecoration(
                    //     prefixIcon: Icon(
                    //       Icons.search,
                    //       color: Colors.white70,
                    //     ),
                    //     enabledBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.all(Radius.circular(10)),
                    //         borderSide: BorderSide(
                    //             color: Colors.white70,
                    //             style: BorderStyle.solid)),
                    //     focusedBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.all(Radius.circular(10)),
                    //         borderSide: BorderSide(
                    //             color: Colors.blue, style: BorderStyle.solid)),
                    //     hintText: "City Name",
                    //     hintStyle: TextStyle(color: Colors.white70),
                    //   ),
                    //   style: const TextStyle(color: Colors.white70),
                    // ),