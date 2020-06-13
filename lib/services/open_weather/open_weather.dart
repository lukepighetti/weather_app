import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srl/models/position.dart';
import 'package:srl/services/app_config/app_config.dart';
import 'package:srl/services/open_weather/endpoints/onecall.dart';
import 'package:srl/services/open_weather/endpoints/weather.dart';
import 'package:srl/services/open_weather/features/fetching.dart';
import 'package:srl/services/open_weather/features/persistence.dart';
import 'package:srl/services/open_weather/features/polling.dart';
import 'package:srl/services/open_weather/models/all_weather_data.dart';

class OpenWeather
    with
        OpenWeatherFetchingDependencies,
        OpenWeatherFetching,
        OpenWeatherPersistenceDependencies,
        OpenWeatherPersistence,
        OpenWeatherPollingDependencies,
        OpenWeatherPolling {
  final AppConfig appConfig;

  final SharedPreferences sharedPreferences;

  OpenWeather({@required this.appConfig, @required this.sharedPreferences});

  /// An offline-ready getter for fetching [OpenWeatherOneCall] and [CurrentWeather]
  Stream<AllWeatherData> getAllWeatherData(PositionModel position) async* {
    OpenWeatherOneCall oneCall;
    CurrentWeather currentWeather;

    /// Fetch & yield from storage
    oneCall = hydrateOpenWeatherOneCall();
    currentWeather = hydrateCurrentWeather();

    if (oneCall != null && currentWeather != null)
      yield AllWeatherData(oneCall, currentWeather);

    /// Fetch & yield from network
    await Future.wait([
      getWeatherOneCall(position).then((e) => oneCall = e),
      getCurrentWeather(position).then((e) => currentWeather = e),
    ]);

    persistOpenWeatherOneCall(oneCall);
    persistCurrentWeather(currentWeather);

    yield AllWeatherData(oneCall, currentWeather);

    /// Fetch & yield periodically
    await for (var _ in onStaleWeather()) {
      await Future.wait([
        getWeatherOneCall(position).then((e) => oneCall = e),
        getCurrentWeather(position).then((e) => currentWeather = e),
      ]);

      persistOpenWeatherOneCall(oneCall);
      persistCurrentWeather(currentWeather);

      yield AllWeatherData(oneCall, currentWeather);
    }
  }
}
