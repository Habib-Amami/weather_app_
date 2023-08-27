import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/models/currrent_weather/coord.dart';

void main() {
  late Coord sut;

  setUp(() {
    sut = Coord(
      lon: 12.34,
      lat: 56.78,
    );
  });

  group("Coord constructor", () {
    test("create Coord instance with valid input", () {
      expect(sut.lon, 12.34);
      expect(sut.lat, 56.78);
    });
  });

  group("Coord.fromJson named constructor", () {
    test("should correctly parse valid JSON data", () {
      final Map<String, dynamic> jsonData = {
        "lon": 25.5,
        "lat": 26.0,
      };

      final coord = Coord.fromJson(jsonData);

      expect(coord.lon, 25.5);
      expect(coord.lat, 26.0);
    });
  });

  group("Coord.toJson", () {
    test("should correctly convert Coord instance to JSON", () {
      final jsonMap = sut.toJson();
      expect(jsonMap['lon'], 12.34);
      expect(jsonMap['lat'], 56.78);
    });
  });
}
