import 'dart:async';

abstract class OpenWeatherPollingDependencies {}

/// Used to determine how often we should be polling for new data
mixin OpenWeatherPolling on OpenWeatherPollingDependencies {
  static const _pollingInterval = Duration(seconds: 60);

  /// Emits an event whenever we should refresh our weather
  Stream onStaleWeather() async* {
    await for (var _ in Stream.periodic(_pollingInterval)) {
      yield null;
    }
  }
}
