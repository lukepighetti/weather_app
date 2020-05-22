import 'package:srl/services/open_weather/annotations.dart';
import 'package:srl/services/open_weather/models/open_weather_description.dart';

part 'onecall.g.dart';

@openWeatherJsonSerializable
class OpenWeatherOneCall {
  final double lat;
  final double lon;
  final String timezone;
  final OpenWeatherCurrent current;
  final List<OpenWeatherHourlyPoint> hourly;

  OpenWeatherOneCall(
    this.lat,
    this.lon,
    this.timezone,
    this.current,
    this.hourly,
  );

  factory OpenWeatherOneCall.fromJson(Map<String, dynamic> json) =>
      _$OpenWeatherOneCallFromJson(json);

  Map<String, dynamic> toJson() => _$OpenWeatherOneCallToJson(this);
}

@openWeatherJsonSerializable
class OpenWeatherHourlyPoint {
  @openWeatherDateTimeKey
  final DateTime dt;
  final double temp;
  final double feelsLike;
  final double pressure;
  final double humidity;
  final double dewPoint;
  final double clouds;
  final double windSpeed;
  final double windDeg;

  @openWeatherDescriptionKey
  final OpenWeatherDescription weather;

  OpenWeatherHourlyPoint(
    this.dt,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.clouds,
    this.windSpeed,
    this.windDeg,
    this.weather,
  );

  factory OpenWeatherHourlyPoint.fromJson(Map<String, dynamic> json) =>
      _$OpenWeatherHourlyPointFromJson(json);

  Map<String, dynamic> toJson() => _$OpenWeatherHourlyPointToJson(this);
}

@openWeatherJsonSerializable
class OpenWeatherCurrent implements OpenWeatherHourlyPoint {
  @openWeatherDateTimeKey
  final DateTime dt;
  @openWeatherDateTimeKey
  final DateTime sunrise;
  @openWeatherDateTimeKey
  final DateTime sunset;

  final double temp;
  final double feelsLike;
  final double pressure;
  final double humidity;
  final double dewPoint;
  final double uvi;
  final double clouds;
  final double visibility;
  final double windSpeed;
  final double windDeg;

  @openWeatherDescriptionKey
  final OpenWeatherDescription weather;

  OpenWeatherCurrent(
      this.dt,
      this.sunrise,
      this.sunset,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.dewPoint,
      this.uvi,
      this.clouds,
      this.visibility,
      this.windSpeed,
      this.windDeg,
      this.weather);

  factory OpenWeatherCurrent.fromJson(Map<String, dynamic> json) =>
      _$OpenWeatherCurrentFromJson(json);

  Map<String, dynamic> toJson() => _$OpenWeatherCurrentToJson(this);
}
