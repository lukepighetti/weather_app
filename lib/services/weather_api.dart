// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:meridian/extensions/extensions.dart';
// import 'package:meridian/app_config.dart';
// import 'package:meridian/models/open_weather_api.dart';
// import 'package:meridian/models/position_model.dart';
// import 'package:meridian/models/weather_model.dart';

// class WeatherService {
//   const WeatherService._();
//   static const instance = WeatherService._();

//   /// Get the latest WeatherModel
//   Future<WeatherModel> fetchWeather(PositionModel position) async {
//     final uri = Uri.parse("${AppConfig.openWeatherBaseUrl}/onecall").replace(
//       queryParameters: {
//         "lat": "${position.latitude}",
//         "lon": "${position.longitude}",
//         "appid": AppConfig.openWeatherApiKey,
//       },
//     );

//     final response = await http.get(uri);
//     final json = jsonDecode(response.body);
//     final oneCall = OpenWeatherOneCall.fromJson(json);
//     return oneCall.asWeatherModel;
//   }
// }
