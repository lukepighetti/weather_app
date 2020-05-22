// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onecall.dart';

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

Map<String, dynamic> _$OpenWeatherOneCallToJson(OpenWeatherOneCall instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'timezone': instance.timezone,
      'current': instance.current,
      'hourly': instance.hourly,
    };

OpenWeatherHourlyPoint _$OpenWeatherHourlyPointFromJson(
    Map<String, dynamic> json) {
  return OpenWeatherHourlyPoint(
    openWeatherDateTimeFrom(json['dt'] as int),
    (json['temp'] as num)?.toDouble(),
    (json['feels_like'] as num)?.toDouble(),
    (json['pressure'] as num)?.toDouble(),
    (json['humidity'] as num)?.toDouble(),
    (json['dew_point'] as num)?.toDouble(),
    (json['clouds'] as num)?.toDouble(),
    (json['wind_speed'] as num)?.toDouble(),
    (json['wind_deg'] as num)?.toDouble(),
    openWeatherDescriptionFrom(json['weather'] as List),
  );
}

Map<String, dynamic> _$OpenWeatherHourlyPointToJson(
        OpenWeatherHourlyPoint instance) =>
    <String, dynamic>{
      'dt': openWeatherDateTimeTo(instance.dt),
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dewPoint,
      'clouds': instance.clouds,
      'wind_speed': instance.windSpeed,
      'wind_deg': instance.windDeg,
      'weather': openWeatherDescriptionTo(instance.weather),
    };

OpenWeatherCurrent _$OpenWeatherCurrentFromJson(Map<String, dynamic> json) {
  return OpenWeatherCurrent(
    openWeatherDateTimeFrom(json['dt'] as int),
    openWeatherDateTimeFrom(json['sunrise'] as int),
    openWeatherDateTimeFrom(json['sunset'] as int),
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
    openWeatherDescriptionFrom(json['weather'] as List),
  );
}

Map<String, dynamic> _$OpenWeatherCurrentToJson(OpenWeatherCurrent instance) =>
    <String, dynamic>{
      'dt': openWeatherDateTimeTo(instance.dt),
      'sunrise': openWeatherDateTimeTo(instance.sunrise),
      'sunset': openWeatherDateTimeTo(instance.sunset),
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dewPoint,
      'uvi': instance.uvi,
      'clouds': instance.clouds,
      'visibility': instance.visibility,
      'wind_speed': instance.windSpeed,
      'wind_deg': instance.windDeg,
      'weather': openWeatherDescriptionTo(instance.weather),
    };
