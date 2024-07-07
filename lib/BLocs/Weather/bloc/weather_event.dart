part of 'weather_bloc.dart';

class WeatherEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchWeather extends WeatherEvent {
  final _city;

  FetchWeather(this._city);

  @override
  // TODO: implement props
  List<Object> get props => [_city];
}

class ResetWeather extends WeatherEvent {}

class FetchWeaterCurrentLocation extends WeatherEvent {
  final lat;
  final long;

  FetchWeaterCurrentLocation(this.lat, this.long);

  @override
  // TODO: implement props
  List<Object> get props => [lat, long];
}
