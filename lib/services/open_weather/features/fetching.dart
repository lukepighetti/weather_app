import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:srl/models/position.dart';
import 'package:srl/services/app_config/app_config.dart';
import 'package:srl/services/open_weather/endpoints/onecall.dart';
import 'package:srl/services/open_weather/endpoints/weather.dart';

abstract class OpenWeatherFetchingDependencies {
  AppConfig get appConfig;
}

/// Used to fetch new data from the network
mixin OpenWeatherFetching on OpenWeatherFetchingDependencies {
  /// Get the latest [OpenWeatherOneCall]
  Future<OpenWeatherOneCall> getWeatherOneCall(PositionModel position) async {
    final uri =
        Uri.parse("https://api.openweathermap.org/data/2.5/onecall").replace(
      queryParameters: {
        "lat": "${position.latitude}",
        "lon": "${position.longitude}",
        "appid": appConfig.openWeatherApiKey,
      },
    );

    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return OpenWeatherOneCall.fromJson(json);
  }

  /// Get the latest [CurrentWeather]
  Future<CurrentWeather> getCurrentWeather(PositionModel position) async {
    final uri =
        Uri.parse("https://api.openweathermap.org/data/2.5/weather").replace(
      queryParameters: {
        "lat": "${position.latitude}",
        "lon": "${position.longitude}",
        "appid": appConfig.openWeatherApiKey,
      },
    );

    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return CurrentWeather.fromJson(json);
  }
}
