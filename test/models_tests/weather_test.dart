import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/models/currrent_weather/weather.dart';

void main() {
  late Weather sut;

  setUp(() {
    sut = Weather(
      description: "Clear sky",
      icon: "01d",
    );
  });

  group("Weather constructor", () {
    test("create Weather instance with valid input", () {
      expect(sut.description, "Clear sky");
      expect(sut.icon, "01d");
    });
  });

  group("Weather.fromJson named constructor", () {
    test("should correctly parse valid JSON data", () {
      final Map<String, dynamic> jsonData = {
        "description": "Cloudy",
        "icon": "03d",
      };

      final weather = Weather.fromJson(jsonData);

      expect(weather.description, "Cloudy");
      expect(weather.icon, "03d");
    });
  });

  group("Weather.toJson", () {
    test("should correctly convert Weather instance to JSON", () {
      final jsonMap = sut.toJson();
      expect(jsonMap['description'], "Clear sky");
      expect(jsonMap['icon'], "01d");
    });
  });
}
