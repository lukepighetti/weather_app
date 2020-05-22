import 'dart:async';

abstract class OpenWeatherPollingDependencies {}

/// Used to determine how often we should be polling for new data
mixin OpenWeatherPolling on OpenWeatherPollingDependencies {
  static const _pollingInterval = Duration(seconds: 60);

  Stream<bool> shouldPollWeather() async* {
    await for (var _ in Stream.periodic(_pollingInterval)) {
      yield true;
    }
  }
}
