import 'package:json_annotation/json_annotation.dart';
import 'package:srl/services/open_weather/models/open_weather_description.dart';

/// The general rules for the OpenWeather API format, used for all serializable classes
const openWeatherJsonSerializable =
    JsonSerializable(createToJson: false, fieldRename: FieldRename.snake);

/// A custom key that handles the special date format from OpenWeather API
const openWeatherDateTimeKey = JsonKey(fromJson: openWeatherDateTimeFrom);
openWeatherDateTimeFrom(int i) =>
    i == null ? null : DateTime.fromMillisecondsSinceEpoch(i * 1000);

/// A custom key that handles the special description format from OpenWeather API
const openWeatherDescriptionKey = JsonKey(fromJson: openWeatherDescriptionFrom);
openWeatherDescriptionFrom(List<dynamic> e) =>
    OpenWeatherDescription.fromJson(e.first);

/// A custom key that handles the special timezone format from OpenWeather API
const openWeatherTimezoneKey = JsonKey(fromJson: openWeatherTimezoneFrom);
openWeatherTimezoneFrom(int i) => Duration(seconds: i);
