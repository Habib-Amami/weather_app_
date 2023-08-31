import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/models/currrent_weather/main_.dart';

void main() {
  late Main sut;

  setUp(
    () {
      sut = Main(
        temp: 20.0,
        feelsLike: 21.0,
        tempMin: 15.0,
        tempMax: 25.0,
        pressure: 1500,
        humidity: 60,
      );
    },
  );

  group(
    " Main constructor",
    () {
      test(
        "create Main instance with valid input",
        () {
          expect(sut.temp, 20.0);
          expect(sut.feelsLike, 21.0);
          expect(sut.tempMin, 15.0);
          expect(sut.tempMax, 25.0);
          expect(sut.pressure, 1500);
          expect(sut.humidity, 60);
        },
      );
    },
  );

  group(
    "Main.fromJson named constructor",
    () {
      test(
        "should correctly parse valid JSON data'",
        () {
          final Map<String, dynamic> jsonData = {
            "temp": 25.5,
            "feels_like": 26.0,
            "temp_min": 24.0,
            "temp_max": 26.0,
            "pressure": 1012,
            "humidity": 70,
          };

          final main = Main.fromJson(jsonData);

          expect(main.temp, 25.5);
          expect(main.feelsLike, 26.0);
          expect(main.tempMin, 24.0);
          expect(main.tempMax, 26.0);
          expect(main.pressure, 1012);
          expect(main.humidity, 70);
        },
      );
    },
  );

  group(
    "Main.toJson",
    () {
      test(
        "should correctly convert Main instance to JSON",
        () {
          final jsonMap = sut.toJson();
          expect(jsonMap['temp'], 20.0);
          expect(jsonMap['feels_like'], 21.0);
          expect(jsonMap['temp_min'], 15.0);
          expect(jsonMap['temp_max'], 25.0);
          expect(jsonMap['pressure'], 1500);
          expect(jsonMap['humidity'], 60);
        },
      );
    },
  );
}
