import 'package:json_annotation/json_annotation.dart';

/// A weather condition icon, ie a cloudy sky.
///
/// From: https://openweathermap.org/weather-conditions#How-to-get-icon-URL
enum OpenWeatherIcon {
  @JsonValue("01d")
  clearSky,
  @JsonValue("01n")
  clearSkyNight,

  @JsonValue("02d")
  fewClouds,
  @JsonValue("02n")
  fewCloudsNight,

  @JsonValue("03d")
  scatteredClouds,
  @JsonValue("03n")
  scatteredCloudsNight,

  @JsonValue("04d")
  brokenClouds,
  @JsonValue("04n")
  brokenCloudsNight,

  @JsonValue("09d")
  showerRain,
  @JsonValue("09n")
  showerRainNight,

  @JsonValue("10d")
  rain,
  @JsonValue("10n")
  rainNight,

  @JsonValue("11d")
  thunderstorm,
  @JsonValue("11n")
  thunderstormNight,

  @JsonValue("13d")
  snow,
  @JsonValue("13n")
  snowNight,

  @JsonValue("50d")
  mist,
  @JsonValue("50n")
  mistNight,
}
