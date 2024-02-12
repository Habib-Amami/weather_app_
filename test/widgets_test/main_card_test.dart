import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/widgets/main_card.dart';

void main() {
  testWidgets("MainCard displays correct weather data",
      (WidgetTester tester) async {
    final responseData = {
      "name": "City Name",
      "weather": [
        {
          "description": "Clear sky",
          "icon": "01d",
        }
      ],
      "main": {
        "temp": 300.0,
        "temp_min": 290.0,
        "temp_max": 310.0,
      },
    };

    await tester.pumpWidget(
      const MaterialApp(
        home: MainCard(
          countryName: "City Name",
          weatherDescription: "Clear sky",
          temp: 300.0,
          tempMin: 290.0,
          tempMax: 310.0,
          icon: "01d",
        ),
      ),
    );

    expect(find.text("City Name"), findsOneWidget);
    expect(find.text("Clear sky"), findsOneWidget);
    expect(find.text("27.9 C°"),
        findsOneWidget); // Ensure the temperature conversion is correct
    expect(find.text("min :16.9 / max :36.9"),
        findsOneWidget); // Ensure the temperature conversion is correct
    expect(find.byType(Image), findsOneWidget);
  });
}
