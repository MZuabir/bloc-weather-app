// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_weather_app/Repos/WeaterRepo/current_locationWeaterRepo.dart';
import 'package:equatable/equatable.dart';

import 'package:bloc_weather_app/BLocs/Weather/bloc/weather_state.dart';
import 'package:flutter/widgets.dart';

import '../../../Models/weatherModel/WeaterModel.dart';
import '../../../Repos/WeaterRepo/weatherRepo.dart';

part 'weather_event.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepo weatherRepo;
  CurrentLocationWeaterReop currentLocationWeaterReop;
  WeatherBloc({required this.weatherRepo, required this.currentLocationWeaterReop})
      : super(WeatherIsNotSearched()) {
    on<FetchWeaterCurrentLocation>((event, emit) async {
      emit(WeatherIsLoading());
      try {
        WeatherModel? weather =
            await currentLocationWeaterReop.getWeather(event.lat, event.long);
        emit(WeatherIsLoaded(weather));
      } catch (error) {}
    });
    on<FetchWeather>((event, emit) async {
      emit(WeatherIsLoading());

      try {
        WeatherModel weather = await weatherRepo.getWeather(event._city);
        emit(WeatherIsLoaded(weather));
      } catch (error) {
        debugPrint('This is error $error');
        emit(WeatherIsNotLoaded());

        // emit(WeatherIsNotSearched());
      }
    });
    on<ResetWeather>((event, emit) => {emit(WeatherIsNotSearched())});
  }
}


//  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
//     if (event is FetchWeather) {
//       yield WeatherIsLoading();

//       try {
//         WeatherModel weather = await weatherRepo.getWeather(event._city);
//         yield WeatherIsLoaded(weather);
//       } catch (error) {
//         print('This is error $error');
//         yield WeatherIsNotLoaded();
//       }
//     } else if (event is ResetWeather) {
//       yield WeatherIsNotSearched();
//     }
//   }