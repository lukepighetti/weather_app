import 'package:flutter/material.dart';
import 'package:srl/screens/weather_screen.dart';

void main() {
  runApp(SRWeatherApp());
}

class SRWeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SR Weather',
      theme: ThemeData(
        colorScheme: ColorScheme.light().copyWith(
          primary: Color(0xff2962FF),
          primaryVariant: Color(0xff0039cb),
          secondary: Color(0xff3BACFF),
          secondaryVariant: Color(0xff007ecb),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark().copyWith(
          primary: Color(0xff2962FF),
          primaryVariant: Color(0xff0039cb),
          secondary: Color(0xff3BACFF),
          secondaryVariant: Color(0xff007ecb),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WeatherScreen(),
    );
  }
}
