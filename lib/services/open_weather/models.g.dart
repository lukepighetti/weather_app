// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenWeatherOneCall _$OpenWeatherOneCallFromJson(Map<String, dynamic> json) {
  return OpenWeatherOneCall(
    (json['lat'] as num)?.toDouble(),
    (json['lon'] as num)?.toDouble(),
    json['timezone'] as String,
    json['current'] == null
        ? null
        : OpenWeatherCurrent.fromJson(json['current'] as Map<String, dynamic>),
    (json['hourly'] as List)
        ?.map((e) => e == null
            ? null
            : OpenWeatherHourlyPoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

OpenWeatherHourlyPoint _$OpenWeatherHourlyPointFromJson(
    Map<String, dynamic> json) {
  return OpenWeatherHourlyPoint(
    _openWeatherDateTimeFrom(json['dt'] as int),
    (json['temp'] as num)?.toDouble(),
    (json['feels_like'] as num)?.toDouble(),
    (json['pressure'] as num)?.toDouble(),
    (json['humidity'] as num)?.toDouble(),
    (json['dew_point'] as num)?.toDouble(),
    (json['clouds'] as num)?.toDouble(),
    (json['wind_speed'] as num)?.toDouble(),
    (json['wind_deg'] as num)?.toDouble(),
    _openWeatherDescriptionFrom(json['weather'] as List),
  );
}

OpenWeatherCurrent _$OpenWeatherCurrentFromJson(Map<String, dynamic> json) {
  return OpenWeatherCurrent(
    _openWeatherDateTimeFrom(json['dt'] as int),
    _openWeatherDateTimeFrom(json['sunrise'] as int),
    _openWeatherDateTimeFrom(json['sunset'] as int),
    (json['temp'] as num)?.toDouble(),
    (json['feels_like'] as num)?.toDouble(),
    (json['pressure'] as num)?.toDouble(),
    (json['humidity'] as num)?.toDouble(),
    (json['dew_point'] as num)?.toDouble(),
    (json['uvi'] as num)?.toDouble(),
    (json['clouds'] as num)?.toDouble(),
    (json['visibility'] as num)?.toDouble(),
    (json['wind_speed'] as num)?.toDouble(),
    (json['wind_deg'] as num)?.toDouble(),
    _openWeatherDescriptionFrom(json['weather'] as List),
  );
}

OpenWeatherDescription _$OpenWeatherDescriptionFromJson(
    Map<String, dynamic> json) {
  return OpenWeatherDescription(
    json['id'] as int,
    json['main'] as String,
    json['description'] as String,
    json['icon'] as String,
  );
}
