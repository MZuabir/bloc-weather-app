// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../../Models/weatherModel/WeaterModel.dart';

class WeatherState extends Equatable {
  @override
  List<Object> get props => [];
}

class WeatherIsNotSearched extends WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherIsLoading extends WeatherState {}

class WeatherIsLoaded extends WeatherState {
  final _weather;

  WeatherIsLoaded(this._weather);

  WeatherModel get getWeather => _weather;

  @override
  List<Object> get props => [_weather];
}

class WeatherIsNotLoaded extends WeatherState {}

class FetchWeaterByLocationLoadedState extends WeatherState {
  final weather;

  FetchWeaterByLocationLoadedState(this.weather);
  WeatherModel get getWeater => weather;
}
