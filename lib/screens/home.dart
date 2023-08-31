import 'package:flutter/material.dart';
import 'package:weather_app/models/currrent_weather/current_weather_model.dart';
import 'package:weather_app/services/current_weather_api/current_weather_api_service.dart';
import 'package:weather_app/widgets/main_card.dart';
import 'package:weather_app/widgets/sun_card.dart';
import 'package:weather_app/widgets/wind_cart.dart';

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
                        MainCard(
                          countryName: snapshot.data!.name.toUpperCase(),
                          weatherDescription:
                              snapshot.data!.weather[0].description,
                          temp: snapshot.data!.main.temp,
                          tempMin: snapshot.data!.main.tempMin,
                          tempMax: snapshot.data!.main.tempMax,
                          icon: snapshot.data!.weather[0].icon,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        WindCard(
                          windSpeed: snapshot.data!.wind.speed,
                          humidity: snapshot.data!.main.humidity,
                          pressure: snapshot.data!.main.pressure,
                          visibility: snapshot.data!.visibility,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SunCard(
                          sunrise: snapshot.data!.sys.sunrise,
                          sunset: snapshot.data!.sys.sunset,
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
