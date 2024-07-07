import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../Models/weatherModel/WeaterModel.dart';

class WeatherRepo {
  Future<WeatherModel> getWeather(String city) async {
    const String apiKey = "43ea6baaad7663dc17637e22ee6f78f2";
    final Uri url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=$apiKey");

    final http.Response response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception("Failed to fetch weather data");
    }

    return WeatherModel.fromJson(json.decode(response.body));
  }
}
