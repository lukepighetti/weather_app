import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:srl/models/position.dart';
import 'package:srl/services/app_config/app_config.dart';
import 'package:srl/services/open_weather/endpoints/onecall.dart';
import 'package:srl/services/open_weather/endpoints/weather.dart';
import 'package:srl/services/open_weather/models/all_weather_data.dart';

class OpenWeather {
  final AppConfig config;

  OpenWeather({@required this.config});

  /// A convenience getter for fetching [OpenWeatherOneCall] and [CurrentWeather]
  Future<AllWeatherData> getAllWeatherData(Position position) async {
    OpenWeatherOneCall oneCall;
    CurrentWeather currentWeather;

    /// A type safe way to perform futures in parallel
    await Future.wait([
      getWeatherOneCall(position).then((e) => oneCall = e),
      getCurrentWeather(position).then((e) => currentWeather = e),
    ]);

    return AllWeatherData(oneCall, currentWeather);
  }

  /// Get the latest [OpenWeatherOneCall]
  Future<OpenWeatherOneCall> getWeatherOneCall(Position position) async {
    final uri =
        Uri.parse("https://api.openweathermap.org/data/2.5/onecall").replace(
      queryParameters: {
        "lat": "${position.latitude}",
        "lon": "${position.longitude}",
        "appid": config.openWeatherApiKey,
      },
    );

    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return OpenWeatherOneCall.fromJson(json);
  }

  /// Get the latest [CurrentWeather]
  Future<CurrentWeather> getCurrentWeather(Position position) async {
    final uri =
        Uri.parse("https://api.openweathermap.org/data/2.5/weather").replace(
      queryParameters: {
        "lat": "${position.latitude}",
        "lon": "${position.longitude}",
        "appid": config.openWeatherApiKey,
      },
    );

    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return CurrentWeather.fromJson(json);
  }
}
