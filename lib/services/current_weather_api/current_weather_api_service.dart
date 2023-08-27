import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/currrent_weather/current_weather_model.dart';

class CurrentWeatherApi {
  // "https://api.openweathermap.org/data/2.5/weather?q=tunis&appid=7d054d3b620169ba3c12a1f728b57a19"
  final String city;
  CurrentWeatherApi({this.city = "tunis"});

  String baseUrl = "https://api.openweathermap.org/data/2.5/weather?q=";
  String apiKey = "&appid=7d054d3b620169ba3c12a1f728b57a19";

  Future<CurrentWeatherModel> fetchCurrentWeatherData() async {
    http.Response response = await http.get(
      Uri.parse(baseUrl + city + apiKey),
    );

    if (response.statusCode == 200) {
      return CurrentWeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("couldn't load data");
    }
  }
}
