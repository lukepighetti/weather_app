import 'package:json_annotation/json_annotation.dart';
import 'package:srl/services/open_weather/models/open_weather_description.dart';

/// The general rules for the OpenWeather API format, used for all serializable classes
const openWeatherJsonSerializable =
    JsonSerializable(createToJson: true, fieldRename: FieldRename.snake);

/// A custom key that handles the special date format from OpenWeather API
const openWeatherDateTimeKey =
    JsonKey(fromJson: openWeatherDateTimeFrom, toJson: openWeatherDateTimeTo);
openWeatherDateTimeFrom(int i) =>
    i == null ? null : DateTime.fromMillisecondsSinceEpoch(i * 1000);
openWeatherDateTimeTo(DateTime e) => e.millisecondsSinceEpoch ~/ 1000;

/// A custom key that handles the special description format from OpenWeather API
const openWeatherDescriptionKey = JsonKey(
    fromJson: openWeatherDescriptionFrom, toJson: openWeatherDescriptionTo);
openWeatherDescriptionFrom(List<dynamic> e) =>
    OpenWeatherDescription.fromJson(e.first);
openWeatherDescriptionTo(OpenWeatherDescription e) => [e.toJson()];

/// A custom key that handles the special timezone format from OpenWeather API
const openWeatherTimezoneKey =
    JsonKey(fromJson: openWeatherTimezoneFrom, toJson: openWeatherTimezoneTo);
openWeatherTimezoneFrom(int i) => Duration(seconds: i);
openWeatherTimezoneTo(Duration e) => e.inSeconds;
