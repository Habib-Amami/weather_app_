import 'package:weather_app/models/currrent_weather/coord.dart';
import 'package:weather_app/models/currrent_weather/main_.dart';
import 'package:weather_app/models/currrent_weather/sys.dart';
import 'package:weather_app/models/currrent_weather/weather.dart';
import 'package:weather_app/models/currrent_weather/wind.dart';

class CurrentWeatherModel {
  Coord coord;
  List<Weather> weather;
  Main main;
  int visibility;
  Wind wind;
  int dt;
  Sys sys;
  int timezone;
  int id;
  String name;
  int cod;

  CurrentWeatherModel({
    required this.coord,
    required this.weather,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) =>
      CurrentWeatherModel(
        coord: Coord.fromJson(json["coord"]),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        main: Main.fromJson(json["main"]),
        visibility: json["visibility"],
        wind: Wind.fromJson(json["wind"]),
        dt: json["dt"],
        sys: Sys.fromJson(json["sys"]),
        timezone: json["timezone"],
        id: json["id"],
        name: json["name"],
        cod: json["cod"],
      );

  Map<String, dynamic> toJson() => {
        "coord": coord.toJson(),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "main": main.toJson(),
        "visibility": visibility,
        "wind": wind.toJson(),
        "dt": dt,
        "sys": sys.toJson(),
        "timezone": timezone,
        "id": id,
        "name": name,
        "cod": cod,
      };
}
