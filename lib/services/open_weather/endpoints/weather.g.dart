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

Map<String, dynamic> _$CurrentWeatherToJson(CurrentWeather instance) =>
    <String, dynamic>{
      'coord': instance.coord,
      'weather': openWeatherDescriptionTo(instance.weather),
      'base': instance.base,
      'main': instance.main,
      'visibility': instance.visibility,
      'wind': instance.wind,
      'clouds': instance.clouds,
      'dt': openWeatherDateTimeTo(instance.dt),
      'timezone': openWeatherTimezoneTo(instance.timezone),
      'id': instance.id,
      'name': instance.name,
      'cod': instance.cod,
    };

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) {
  return Coordinates(
    (json['lat'] as num)?.toDouble(),
    (json['lon'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };

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

Map<String, dynamic> _$MainWeatherToJson(MainWeather instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };

Wind _$WindFromJson(Map<String, dynamic> json) {
  return Wind(
    (json['speed'] as num)?.toDouble(),
    (json['deg'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$WindToJson(Wind instance) => <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
    };

Clouds _$CloudsFromJson(Map<String, dynamic> json) {
  return Clouds(
    (json['all'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$CloudsToJson(Clouds instance) => <String, dynamic>{
      'all': instance.all,
    };

Sys _$SysFromJson(Map<String, dynamic> json) {
  return Sys(
    json['type'] as int,
    json['id'] as int,
    json['country'] as String,
    openWeatherDateTimeFrom(json['sunrise'] as int),
    openWeatherDateTimeFrom(json['sunset'] as int),
  );
}

Map<String, dynamic> _$SysToJson(Sys instance) => <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'country': instance.country,
      'sunrise': openWeatherDateTimeTo(instance.sunrise),
      'sunset': openWeatherDateTimeTo(instance.sunset),
    };
