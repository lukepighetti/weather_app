import 'package:geolocator/geolocator.dart';

class AppConfig {
  final openWeatherApiKey = "f1ee1340b29863b3a7c951dcafc34874";

  final locationOptions = LocationOptions(
    accuracy: LocationAccuracy.lowest,
    timeInterval: Duration(minutes: 5).inMilliseconds,
  );
}
