import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/models/currrent_weather/sys.dart';

void main() {
  late Sys sut;

  setUp(() {
    sut = Sys(
      sunrise: 1630066800,
      sunset: 1630116931,
    );
  });

  group("Sys constructor", () {
    test("create Sys instance with valid input", () {
      expect(sut.sunrise, 1630066800);
      expect(sut.sunset, 1630116931);
    });
  });

  group("Sys.fromJson named constructor", () {
    test("should correctly parse valid JSON data", () {
      final Map<String, dynamic> jsonData = {
        "sunrise": 1630066800,
        "sunset": 1630116931,
      };

      final sys = Sys.fromJson(jsonData);

      expect(sys.sunrise, 1630066800);
      expect(sys.sunset, 1630116931);
    });
  });

  group("Sys.toJson", () {
    test("should correctly convert Sys instance to JSON", () {
      final jsonMap = sut.toJson();
      expect(jsonMap['sunrise'], 1630066800);
      expect(jsonMap['sunset'], 1630116931);
    });
  });
}
