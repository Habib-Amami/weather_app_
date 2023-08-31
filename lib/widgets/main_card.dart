import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainCard extends StatelessWidget {
  final String countryName;
  final String weatherDescription;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String icon;

  const MainCard({
    required this.countryName,
    required this.weatherDescription,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      shadowColor: Colors.white70,
      elevation: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child:
                    // -- this text represents the country name
                    Text(
                  countryName,
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                child:
                    // -- this text represents the current date
                    Text(
                  DateFormat.yMMMMd('en_US').format(
                    DateTime.now(),
                  ),
                  style: const TextStyle(
                    fontFamily: "BarlowCondensed",
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child:
                            // -- this text represents the current main weather
                            Text(
                          weatherDescription,
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child:
                            //-- this text represents the curren temp
                            Text(
                          "${((temp) - 273.15).toStringAsFixed(1)} C\u00B0",
                          style: const TextStyle(
                            fontFamily: "BarlowCondensed",
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 20,
                          left: 10,
                          right: 10,
                        ),
                        child: Text(
                          "min :${((tempMin) - 273.15).toStringAsFixed(1)} / max :${((tempMax) - 273.15).toStringAsFixed(1)}",
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Image.network(
                      'http://openweathermap.org/img/w/$icon.png',
                      scale: 0.5,
                      alignment: AlignmentDirectional.topCenter,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
