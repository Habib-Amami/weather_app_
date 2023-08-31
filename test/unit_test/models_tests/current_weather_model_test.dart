import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/models/currrent_weather/coord.dart';
import 'package:weather_app/models/currrent_weather/current_weather_model.dart';
import 'package:weather_app/models/currrent_weather/main_.dart';
import 'package:weather_app/models/currrent_weather/sys.dart';
import 'package:weather_app/models/currrent_weather/weather.dart';
import 'package:weather_app/models/currrent_weather/wind.dart';

void main() {
  group("CurrentWeatherModel.fromJson", () {
    test("should correctly parse valid JSON data", () {
      final Map<String, dynamic> jsonData = {
        "coord": {"lon": 12.34, "lat": 56.78},
        "weather": [
          {"description": "Clear sky", "icon": "01d"}
        ],
        "main": {
          "temp": 20.0,
          "feels_like": 21.0,
          "temp_min": 15.0,
          "temp_max": 25.0,
          "pressure": 1500,
          "humidity": 60
        },
        "visibility": 10000,
        "wind": {"speed": 10.0},
        "dt": 163006800,
        "sys": {"sunrise": 163008000, "sunset": 163016931},
        "timezone": 7200,
        "id": 12345,
        "name": "City Name",
        "cod": 200
      };

      final currentWeather = CurrentWeatherModel.fromJson(jsonData);

      expect(currentWeather.coord.lon, 12.34);
      expect(currentWeather.coord.lat, 56.78);
      expect(currentWeather.weather[0].description, "Clear sky");
      expect(currentWeather.weather[0].icon, "01d");
      expect(currentWeather.main.temp, 20.0);
      expect(currentWeather.main.feelsLike, 21.0);
      expect(currentWeather.main.tempMin, 15.0);
      expect(currentWeather.main.tempMax, 25.0);
      expect(currentWeather.visibility, 10000);
      expect(currentWeather.wind.speed, 10.0);
      expect(currentWeather.dt, 163006800);
      expect(currentWeather.sys.sunrise, 163008000);
      expect(currentWeather.sys.sunset, 163016931);
      expect(currentWeather.timezone, 7200);
      expect(currentWeather.id, 12345);
      expect(currentWeather.name, "City Name");
      expect(currentWeather.cod, 200);
    });
  });

  group("CurrentWeatherModel.toJson", () {
    test("should correctly convert CurrentWeatherModel instance to JSON", () {
      final currentWeather = CurrentWeatherModel(
        coord: Coord(lon: 12.34, lat: 56.78),
        weather: [Weather(description: "Clear sky", icon: "01d")],
        main: Main(
          temp: 20.0,
          feelsLike: 21.0,
          tempMin: 15.0,
          tempMax: 25.0,
          pressure: 1500,
          humidity: 60,
        ),
        visibility: 10000,
        wind: Wind(speed: 10.0),
        dt: 1630066800,
        sys: Sys(sunrise: 1630068000, sunset: 1630116931),
        timezone: 7200,
        id: 123456,
        name: "City Name",
        cod: 200,
      );

      final jsonMap = currentWeather.toJson();

      expect(jsonMap['coord']['lon'], 12.34);
      expect(jsonMap['coord']['lat'], 56.78);
      expect(jsonMap['weather'][0]['description'], "Clear sky");
      expect(jsonMap['weather'][0]['icon'], "01d");
      expect(jsonMap['main']['temp'], 20.0);
      expect(jsonMap['main']['feels_like'], 21.0);
      expect(jsonMap['main']['temp_min'], 15.0);
      expect(jsonMap['main']['temp_max'], 25.0);
      expect(jsonMap['visibility'], 10000);
      expect(jsonMap['wind']['speed'], 10.0);
      expect(jsonMap['dt'], 1630066800);
      expect(jsonMap['sys']['sunrise'], 1630068000);
      expect(jsonMap['sys']['sunset'], 1630116931);
      expect(jsonMap['timezone'], 7200);
      expect(jsonMap['id'], 123456);
      expect(jsonMap['name'], "City Name");
      expect(jsonMap['cod'], 200);
    });
  });
}
