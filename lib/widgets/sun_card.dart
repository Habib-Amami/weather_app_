import 'package:flutter/material.dart';
import 'package:unixtime/unixtime.dart';

import '../constants/images.dart';

class SunCard extends StatelessWidget {
  final int sunrise;
  final int sunset;
  const SunCard({super.key, required this.sunrise, required this.sunset});

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
            padding: EdgeInsets.all(20),
            child: Text(
              "Sunset and Sunrise",
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      "Sunrise",
                      style: TextStyle(
                        fontFamily: "BarlowCondensed",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${sunrise.toUnixTime().toString().substring(11, 16)} AM",
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Image.asset(
                  Images.sunImage,
                  width: 150,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    const Text(
                      "Sunrise",
                      style: TextStyle(
                        fontFamily: "BarlowCondensed",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${sunset.toUnixTime().toString().substring(11, 16)} PM",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
