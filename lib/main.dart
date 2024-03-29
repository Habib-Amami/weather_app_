import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/screens/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Home(),
      ),
    );
  }
}
