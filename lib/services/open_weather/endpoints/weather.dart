import 'package:srl/services/open_weather/annotations.dart';
import 'package:srl/services/open_weather/models/open_weather_description.dart';

part 'weather.g.dart';

@openWeatherJsonSerializable
class CurrentWeather {
  final Coordinates coord;

  @openWeatherDescriptionKey
  final OpenWeatherDescription weather;

  final String base;
  final MainWeather main;
  final int visibility;
  final Wind wind;
  final Clouds clouds;

  @openWeatherDateTimeKey
  final DateTime dt;

  @openWeatherTimezoneKey
  final Duration timezone;

  final int id;
  final String name;
  final int cod;

  CurrentWeather(
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.dt,
    this.timezone,
    this.id,
    this.name,
    this.cod,
    this.clouds,
  );

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentWeatherToJson(this);
}

@openWeatherJsonSerializable
class Coordinates {
  final double lat;
  final double lon;

  Coordinates(this.lat, this.lon);
  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);
  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}

@openWeatherJsonSerializable
class MainWeather {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final double pressure;
  final double humidity;

  MainWeather(this.temp, this.feelsLike, this.tempMin, this.tempMax,
      this.pressure, this.humidity);
  factory MainWeather.fromJson(Map<String, dynamic> json) =>
      _$MainWeatherFromJson(json);
  Map<String, dynamic> toJson() => _$MainWeatherToJson(this);
}

@openWeatherJsonSerializable
class Wind {
  final double speed;
  final double deg;

  Wind(this.speed, this.deg);
  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
  Map<String, dynamic> toJson() => _$WindToJson(this);
}

@openWeatherJsonSerializable
class Clouds {
  final double all;

  Clouds(this.all);
  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
  Map<String, dynamic> toJson() => _$CloudsToJson(this);
}

@openWeatherJsonSerializable
class Sys {
  final int type;
  final int id;
  final String country;

  @openWeatherDateTimeKey
  final DateTime sunrise;

  @openWeatherDateTimeKey
  final DateTime sunset;

  Sys(this.type, this.id, this.country, this.sunrise, this.sunset);
  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
  Map<String, dynamic> toJson() => _$SysToJson(this);
}
