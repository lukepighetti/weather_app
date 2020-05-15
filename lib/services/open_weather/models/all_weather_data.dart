import 'package:srl/services/open_weather/endpoints/onecall.dart';
import 'package:srl/services/open_weather/endpoints/weather.dart';

/// A convenience model used to aggregate all weather data for a location
class AllWeatherData {
  final OpenWeatherOneCall oneCall;
  final CurrentWeather currentWeather;

  AllWeatherData(this.oneCall, this.currentWeather);
}
