class WeatherModel {
  final double temp;
  final int pressure;
  final int humidity;
  final double temp_max;
  final double temp_min;
  final String country;
  final String cityName;
  final int weatherId;
  final String weatherMain;
  final String weatherDescription;
  final String weatherIcon;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final double windGust;
  final double rain1h;
  final int cloudsAll;
  final int dt;
  final int sunrise;
  final int sunset;

  double get getTemp => temp - 272.5;
  double get getMaxTemp => temp_max - 272.5;
  double get getMinTemp => temp_min - 272.5;

  WeatherModel({
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.temp_max,
    required this.temp_min,
    required this.country,
    required this.cityName,
    required this.weatherId,
    required this.weatherMain,
    required this.weatherDescription,
    required this.weatherIcon,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.rain1h,
    required this.cloudsAll,
    required this.dt,
    required this.sunrise,
    required this.sunset,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temp: json["main"]["temp"],
      pressure: json["main"]["pressure"],
      humidity: json["main"]["humidity"],
      temp_max: json["main"]["temp_max"],
      temp_min: json["main"]["temp_min"],
      country: json["sys"]["country"],
      cityName: json["name"],
      weatherId: json["weather"][0]["id"],
      weatherMain: json["weather"][0]["main"],
      weatherDescription: json["weather"][0]["description"],
      weatherIcon: json["weather"][0]["icon"],
      visibility: json["visibility"],
      windSpeed: json["wind"]["speed"],
      windDeg: json["wind"]["deg"],
      windGust: json["wind"]["gust"],
      rain1h: json["rain"] != null ? json["rain"]["1h"] : 0.0,
      cloudsAll: json["clouds"]["all"],
      dt: json["dt"],
      sunrise: json["sys"]["sunrise"],
      sunset: json["sys"]["sunset"],
    );
  }
}
