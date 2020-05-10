import 'package:flutter/material.dart';
import 'package:srl/extensions/date_time.dart';
import 'package:srl/extensions/num.dart';
import 'package:srl/services/open_weather/open_weather.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WhenRebuilder<OpenWeatherOneCall>(
          observe: () => RM.future(RM.get<OpenWeather>().value.fetchWeather()),
          onIdle: () => Center(child: Text("We're waiting for the weather!")),
          onWaiting: () => Center(child: CircularProgressIndicator()),
          onError: (error) => Center(child: Text("$error")),
          onData: (weatherCall) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  /// Header
                  SizedBox(
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("It feels like"),
                        SizedBox(height: 16),
                        Text(
                          '${weatherCall.current.feelsLike.asPrettyFahrenheit}°F',
                          style: TextStyle(fontSize: 36),
                        ),
                      ],
                    ),
                  ),

                  /// 48-hours
                  for (final hour in weatherCall.hourly)
                    ListTile(
                      leading: Text(hour.dt.asHour),
                      title: Text(hour.weather.description),
                      subtitle: Text("${hour.windSpeed.asThreeSigFigs} mph"),
                      trailing: Text(
                        hour.temp.asPrettyFahrenheit,
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
