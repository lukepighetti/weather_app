import 'package:flutter/material.dart';
import 'package:srl/screens/weather_screen.dart';
import 'package:srl/services/app_config/app_config.dart';
import 'package:srl/services/open_weather/open_weather.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

void main() {
  runApp(SRWeatherApp());
}

class SRWeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector(
      inject: [
        /// AppConfig
        Inject<AppConfig>(
          () => AppConfig(),
        ),

        /// OpenWeather
        Inject<OpenWeather>(
          () => OpenWeather(
            config: IN.get<AppConfig>(),
          ),
        ),
      ],
      builder: (context) {
        return MaterialApp(
          title: 'SR Weather',
          theme: ThemeData(
            fontFamily: "Brandon",
            primaryColor: Color(0xff0303D3),
            accentColor: Color(0xff4944D5),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          darkTheme: ThemeData(
            fontFamily: "Brandon",
            brightness: Brightness.dark,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          themeMode: ThemeMode.light,
          routes: {
            "/": (_) => WeatherScreen(),
          },
        );
      },
    );
  }
}
