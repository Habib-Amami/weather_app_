import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unixtime/unixtime.dart';
import 'package:weather_app/models/currrent_weather/current_weather_model.dart';
import 'package:weather_app/services/current_weather_api/current_weather_api_service.dart';

import '../constants/images.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<CurrentWeatherModel> currentWeather =
      CurrentWeatherApi().fetchCurrentWeatherData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: FutureBuilder(
          future: currentWeather,
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
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 6,
                            right: 6,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Search for a country",
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              prefixIcon: const Icon(Icons.search),
                              prefixIconColor: MaterialStateColor.resolveWith(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.focused)) {
                                    return Colors.black;
                                  }
                                  return Colors.grey;
                                },
                              ),
                            ),
                            onFieldSubmitted: (value) {
                              setState(() {
                                currentWeather = CurrentWeatherApi(city: value)
                                    .fetchCurrentWeatherData();
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //-- main card (city, temp, main weather, ....)
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
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
                                      snapshot.data!.name.toUpperCase(),
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
                                              snapshot
                                                  .data!.weather[0].description,
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
                                              "${((snapshot.data!.main.temp) - 273.15).toStringAsFixed(1)} C\u00B0",
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
                                              "min :${((snapshot.data!.main.tempMin) - 273.15).toStringAsFixed(1)} / max :${((snapshot.data!.main.tempMax) - 273.15).toStringAsFixed(1)}",
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
                                        padding:
                                            const EdgeInsets.only(bottom: 20),
                                        child: Image.network(
                                          'http://openweathermap.org/img/w/${snapshot.data!.weather[0].icon}.png',
                                          scale: 0.5,
                                          alignment:
                                              AlignmentDirectional.topCenter,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                    Text("${snapshot.data!.wind.speed}  m/s"),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                    Text("${snapshot.data!.main.humidity} %"),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                    Text("${snapshot.data!.main.pressure} hPa"),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                    Text(
                                        "${(snapshot.data!.visibility) / 1000} Km"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
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
                                            "${snapshot.data!.sys.sunrise.toUnixTime().toString().substring(11, 16)} AM"),
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
                                            "${snapshot.data!.sys.sunset.toUnixTime().toString().substring(11, 16)} PM"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
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
