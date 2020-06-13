import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
        /// SharedPreferences
        Inject<SharedPreferences>.future(
          () => SharedPreferences.getInstance(),
        ),

        /// AppConfig
        Inject<AppConfig>(
          () => AppConfig(),
        ),

        /// OpenWeather
        Inject<OpenWeather>.future(
          () async => OpenWeather(
            appConfig: IN.get<AppConfig>(),
            sharedPreferences: await RM.get<SharedPreferences>().stateAsync,
          ),
        ),
      ],

      /// Splash screen until dependencies are ready
      builder: (context) {
        return WhenRebuilderOr(
          observeMany: [
            () => RM.get<OpenWeather>(),
          ],
          builder: (_, __) => buildSplashScreen(context),
          onData: (_) => buildMaterialApp(context),
        );
      },
    );
  }

  Widget buildSplashScreen(BuildContext context) {
    return Material();
  }

  Widget buildMaterialApp(BuildContext context) {
    return MaterialApp(
      title: 'SR Weather',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Brandon",
        primaryColor: Color(0xff0303D3),
        accentColor: Color(0xff00EDFC),
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
  }
}
