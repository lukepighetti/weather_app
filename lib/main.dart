import 'package:flutter/material.dart';
import 'package:srl/screens/weather_screen.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:srl/services/weather_api.dart';

void main() {
  runApp(SRWeatherApp());
}

class SRWeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector(
      inject: [
        Inject<WeatherService>(() => WeatherService.instance),
      ],
      builder: (context) {
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
      },
    );
  }
}
