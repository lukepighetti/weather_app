import 'package:flutter/material.dart';
import 'package:srl/services/weather_api.dart';
import 'package:srl/services/weather_api_models.dart';
import 'package:srl/extensions/double.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherService _weatherService = WeatherService.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<OpenWeatherOneCall>(
        future: _weatherService.fetchWeather(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final weatherCall = snapshot.data;
            return Center(
              child: Text(
                '${weatherCall.current.temp.asFahrenheit.toStringAsPrecision(3)}',
              ),
            );
          }
        },
      ),
    );
  }
}
