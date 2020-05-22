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
    json['icon'] as String,
  );
}

Map<String, dynamic> _$OpenWeatherDescriptionToJson(
        OpenWeatherDescription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };
