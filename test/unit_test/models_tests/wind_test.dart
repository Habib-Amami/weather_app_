import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/models/currrent_weather/wind.dart';

void main() {
  late Wind sut;

  setUp(() {
    sut = Wind(
      speed: 10.0,
    );
  });

  group("Wind constructor", () {
    test("create Wind instance with valid input", () {
      expect(sut.speed, 10.0);
    });
  });

  group("Wind.fromJson named constructor", () {
    test("should correctly parse valid JSON data", () {
      final Map<String, dynamic> jsonData = {
        "speed": 7.5,
      };

      final wind = Wind.fromJson(jsonData);

      expect(wind.speed, 7.5);
    });
  });

  group("Wind.toJson", () {
    test("should correctly convert Wind instance to JSON", () {
      final jsonMap = sut.toJson();
      expect(jsonMap['speed'], 10.0);
    });
  });
}
