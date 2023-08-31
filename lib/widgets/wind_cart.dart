import 'package:flutter/material.dart';

class WindCard extends StatelessWidget {
  final double windSpeed;
  final int humidity;
  final int pressure;
  final int visibility;

  const WindCard({
    super.key,
    required this.windSpeed,
    required this.humidity,
    required this.pressure,
    required this.visibility,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      shadowColor: Colors.white70,
      elevation: 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 20,
              bottom: 20,
              left: 20,
              right: 20,
            ),
            child: Text(
              "Wind and Humidity",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.air),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Wind speed",
                      style: TextStyle(
                        fontFamily: "BarlowCondensed",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Text("$windSpeed  m/s"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.water_drop),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Humidity",
                      style: TextStyle(
                        fontFamily: "BarlowCondensed",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Text("$humidity %"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.cloud),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Air pressure",
                      style: TextStyle(
                        fontFamily: "BarlowCondensed",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Text("$pressure hPa"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.visibility),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "visibility",
                      style: TextStyle(
                        fontFamily: "BarlowCondensed",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Text("${(visibility) / 1000} Km"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
