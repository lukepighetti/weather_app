import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// A convenience wrapper for Lottie animated icons
class SRLAnimatedIcon extends StatelessWidget {
  final AnimatedIconType type;

  final double dimension;

  const SRLAnimatedIcon(
      {Key key, this.type = AnimatedIconType.thunderStorm, this.dimension = 64})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.square(dimension),
      child: Lottie.asset("assets/lottie/${type.filename}"),
    );
  }
}

/// The animated icon to display
enum AnimatedIconType {
  clearSkyDay,
  clearSkyNight,
  cloudy,
  fog,
  hurricane,
  partlyCloudyDay,
  partlyCloudyNight,
  rain,
  snow,
  thunderStorm,
  tornado,
  windy,
}

/// Enables looking up icon filenames
extension AnimatedIconTypeGettersX on AnimatedIconType {
  String get filename {
    switch (this) {
      case AnimatedIconType.clearSkyDay:
        return "clear-sky-day.json";
      case AnimatedIconType.clearSkyNight:
        return "clear-sky-night.json";
      case AnimatedIconType.cloudy:
        return "cloudy.json";
      case AnimatedIconType.fog:
        return "fog.json";
      case AnimatedIconType.hurricane:
        return "hurricane.json";
      case AnimatedIconType.partlyCloudyDay:
        return "partly-cloudy-day.json";
      case AnimatedIconType.partlyCloudyNight:
        return "partly-cloudy-night.json";
      case AnimatedIconType.rain:
        return "rain.json";
      case AnimatedIconType.snow:
        return "snow.json";
      case AnimatedIconType.thunderStorm:
        return "thunder-storm.json";
      case AnimatedIconType.tornado:
        return "tornado.json";
      case AnimatedIconType.windy:
      default:
        return "windy.json";
    }
  }
}
