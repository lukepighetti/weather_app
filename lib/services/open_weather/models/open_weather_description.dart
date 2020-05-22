import 'package:srl/services/open_weather/annotations.dart';

part 'open_weather_description.g.dart';

@openWeatherJsonSerializable
class OpenWeatherDescription {
  final int id;
  final String main;
  final String description;
  final String icon;

  OpenWeatherDescription(this.id, this.main, this.description, this.icon);

  factory OpenWeatherDescription.fromJson(Map<String, dynamic> json) =>
      _$OpenWeatherDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$OpenWeatherDescriptionToJson(this);
}
