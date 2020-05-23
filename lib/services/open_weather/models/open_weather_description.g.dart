// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_weather_description.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenWeatherDescription _$OpenWeatherDescriptionFromJson(
    Map<String, dynamic> json) {
  return OpenWeatherDescription(
    json['id'] as int,
    json['main'] as String,
    json['description'] as String,
    _$enumDecodeNullable(_$OpenWeatherIconEnumMap, json['icon']),
  );
}

Map<String, dynamic> _$OpenWeatherDescriptionToJson(
        OpenWeatherDescription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': _$OpenWeatherIconEnumMap[instance.icon],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$OpenWeatherIconEnumMap = {
  OpenWeatherIcon.clearSky: '01d',
  OpenWeatherIcon.clearSkyNight: '01n',
  OpenWeatherIcon.fewClouds: '02d',
  OpenWeatherIcon.fewCloudsNight: '02n',
  OpenWeatherIcon.scatteredClouds: '03d',
  OpenWeatherIcon.scatteredCloudsNight: '03n',
  OpenWeatherIcon.brokenClouds: '04d',
  OpenWeatherIcon.brokenCloudsNight: '04n',
  OpenWeatherIcon.showerRain: '09d',
  OpenWeatherIcon.showerRainNight: '09n',
  OpenWeatherIcon.rain: '10d',
  OpenWeatherIcon.rainNight: '10n',
  OpenWeatherIcon.thunderstorm: '11d',
  OpenWeatherIcon.thunderstormNight: '11n',
  OpenWeatherIcon.snow: '13d',
  OpenWeatherIcon.snowNight: '13n',
  OpenWeatherIcon.mist: '50d',
  OpenWeatherIcon.mistNight: '50n',
};
