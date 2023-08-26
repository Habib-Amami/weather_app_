import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/services/current_weather_api.dart/current_weather_api_service.dart';

import '../constants/images.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: CurrentWeatherApi(city: "france").fetchCurrentWeatherData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Images.backgroundImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        //-- main card (city, temp, main weather, ....)
                        Card(
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
                                    padding: const EdgeInsets.all(20.0),
                                    child:
                                        Text(snapshot.data!.name.toUpperCase()),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 20,
                                      left: 20,
                                      right: 20,
                                    ),
                                    child: Text(
                                      DateFormat.yMMMMd('en_US').format(
                                        DateTime.now(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text(snapshot
                                              .data!.weather[0].description),
                                          Text(((snapshot.data!.main.temp) -
                                                  273.15)
                                              .toStringAsFixed(1)),
                                          Text(
                                              "min :${((snapshot.data!.main.tempMin) - 273.15).toStringAsFixed(1)}/max :${((snapshot.data!.main.feelsLike) - 273.15).toStringAsFixed(1)}")
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 50,
                                      ),
                                      const Icon(Icons.cloud)
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
