import 'package:flutter/material.dart';
import 'package:srl/services/weather_api.dart';
import 'package:srl/services/weather_api_models.dart';
import 'package:srl/extensions/double.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final ReactiveModel<OpenWeatherOneCall> weatherOneCall =
      ReactiveModel.create(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: WhenRebuilder<OpenWeatherOneCall>(
          observe: () => weatherOneCall,
          initState: (context, reactiveModel) => reactiveModel.future(
            (initialValue) => RM.get<WeatherService>().value.fetchWeather(),
          ),
          onIdle: () => Text("Waiting for weather..."),
          onWaiting: () => CircularProgressIndicator(),
          onError: (e) => Text(e),
          onData: (OpenWeatherOneCall weatherCall) => Text(
            '${weatherCall.current.temp.asFahrenheit.toStringAsPrecision(3)}',
          ),
        ),
      ),
    );
  }
}
