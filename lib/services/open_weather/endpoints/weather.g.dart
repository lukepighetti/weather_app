// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) {
  return CurrentWeather(
    json['coord'] == null
        ? null
        : Coordinates.fromJson(json['coord'] as Map<String, dynamic>),
    openWeatherDescriptionFrom(json['weather'] as List),
    json['base'] as String,
    json['main'] == null
        ? null
        : MainWeather.fromJson(json['main'] as Map<String, dynamic>),
    json['visibility'] as int,
    json['wind'] == null
        ? null
        : Wind.fromJson(json['wind'] as Map<String, dynamic>),
    openWeatherDateTimeFrom(json['dt'] as int),
    openWeatherTimezoneFrom(json['timezone'] as int),
    json['id'] as int,
    json['name'] as String,
    json['cod'] as int,
    json['clouds'] == null
        ? null
        : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
  );
}

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) {
  return Coordinates(
    (json['lat'] as num)?.toDouble(),
    (json['lon'] as num)?.toDouble(),
  );
}

MainWeather _$MainWeatherFromJson(Map<String, dynamic> json) {
  return MainWeather(
    (json['temp'] as num)?.toDouble(),
    (json['feels_like'] as num)?.toDouble(),
    (json['temp_min'] as num)?.toDouble(),
    (json['temp_max'] as num)?.toDouble(),
    (json['pressure'] as num)?.toDouble(),
    (json['humidity'] as num)?.toDouble(),
  );
}

Wind _$WindFromJson(Map<String, dynamic> json) {
  return Wind(
    (json['speed'] as num)?.toDouble(),
    (json['deg'] as num)?.toDouble(),
  );
}

Clouds _$CloudsFromJson(Map<String, dynamic> json) {
  return Clouds(
    (json['all'] as num)?.toDouble(),
  );
}

Sys _$SysFromJson(Map<String, dynamic> json) {
  return Sys(
    json['type'] as int,
    json['id'] as int,
    json['country'] as String,
    openWeatherDateTimeFrom(json['sunrise'] as int),
    openWeatherDateTimeFrom(json['sunset'] as int),
  );
}
