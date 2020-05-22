import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:srl/services/open_weather/endpoints/onecall.dart';
import 'package:srl/services/open_weather/endpoints/weather.dart';

abstract class OpenWeatherPersistenceDependencies {
  SharedPreferences get sharedPreferences;
}

/// Primarily used for offline mode, the persistence feature
/// allows storing and retreiving data from the local device.
mixin OpenWeatherPersistence on OpenWeatherPersistenceDependencies {
  /// [OpenWeatherOneCall]
  static const _openWeatherOneCallKey =
      "OpenWeatherPersistence.OpenWeatherOneCall";

  void persistOpenWeatherOneCall(OpenWeatherOneCall data) {
    final json = data.toJson();
    final value = jsonEncode(json);
    sharedPreferences.setString(_openWeatherOneCallKey, value);
  }

  OpenWeatherOneCall hydrateOpenWeatherOneCall() {
    final source = sharedPreferences.getString(_openWeatherOneCallKey);

    /// Guard no source
    if (source == null) return null;

    final json = jsonDecode(source);
    return OpenWeatherOneCall.fromJson(json);
  }

  /// [CurrentWeather]
  static const _CurrentWeatherKey = "OpenWeatherPersistence.CurrentWeather";

  void persistCurrentWeather(CurrentWeather data) {
    final json = data.toJson();
    final value = jsonEncode(json);
    sharedPreferences.setString(_CurrentWeatherKey, value);
  }

  CurrentWeather hydrateCurrentWeather() {
    final source = sharedPreferences.getString(_CurrentWeatherKey);

    /// Guard no source
    if (source == null) return null;

    final json = jsonDecode(source);
    return CurrentWeather.fromJson(json);
  }
}
