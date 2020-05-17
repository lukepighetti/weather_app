import 'dart:math' as math;

import 'package:srl/services/open_weather/endpoints/onecall.dart';

extension OpenWeatherHourlyPointAggregationX on List<OpenWeatherHourlyPoint> {
  double get maxTemp => this.fold<double>(this.first.temp, (a, b) => math.max(a, b.temp));
  double get minTemp => this.fold<double>(this.first.temp, (a, b) => math.min(a, b.temp));
}
