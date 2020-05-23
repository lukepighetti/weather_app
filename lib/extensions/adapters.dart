import 'package:srl/services/open_weather/models/open_weather_icon.dart';
import 'package:srl/widgets/animated_icon.dart';

extension AnimatedIconAdapterX on OpenWeatherIcon {
  AnimatedIconType get asAnimatedIcon {
    switch (this) {

      /// Clear sky
      case OpenWeatherIcon.clearSky:
        return AnimatedIconType.clearSkyDay;

      case OpenWeatherIcon.clearSkyNight:
        return AnimatedIconType.clearSkyNight;

      /// Partly cloudy
      case OpenWeatherIcon.brokenClouds:
      case OpenWeatherIcon.fewClouds:
        return AnimatedIconType.partlyCloudyDay;

      case OpenWeatherIcon.brokenCloudsNight:
      case OpenWeatherIcon.fewCloudsNight:
        return AnimatedIconType.partlyCloudyNight;

      /// Cloudy
      case OpenWeatherIcon.scatteredClouds:
      case OpenWeatherIcon.scatteredCloudsNight:
        return AnimatedIconType.cloudy;

      /// Rain
      case OpenWeatherIcon.showerRain:
      case OpenWeatherIcon.showerRainNight:
      case OpenWeatherIcon.rain:
      case OpenWeatherIcon.rainNight:
        return AnimatedIconType.rain;

      /// Thunder
      case OpenWeatherIcon.thunderstorm:
      case OpenWeatherIcon.thunderstormNight:
        return AnimatedIconType.thunderStorm;

      /// Snow
      case OpenWeatherIcon.snow:
      case OpenWeatherIcon.snowNight:
        return AnimatedIconType.snow;

      /// Fog
      case OpenWeatherIcon.mist:
      case OpenWeatherIcon.mistNight:
        return AnimatedIconType.fog;

      default:
        return AnimatedIconType.clearSkyDay;
    }
  }
}
