/// Enables us to convert Kelvin to fahrenheit or celsius
extension TemperatureConversionsX on num {
  /// Convert kelvin to fahrenheit
  static double _k2f(double kelvin) => kelvin * 9 / 5 - 459.67;

  /// Convert fahrenheit to celsius
  static double _f2c(double fahrenheit) => (fahrenheit - 32) / (9 / 5);

  double get asFahrenheit => _k2f(this);
  double get asCelsius => _f2c(_k2f(this));

  String get asPrettyFahrenheit => this.asFahrenheit.asThreeSigFigs;
}

extension DoubleFormattingX on num {
  String get asThreeSigFigs => this.toStringAsPrecision(3);
}

extension PageTransitionX on double {
  PageTransition pageTransition(int pageIndex) =>
      PageTransition(this, pageIndex);
}

/// A transition/animation based on pagination. Useful for
/// creating opacity/position transitions based on a PageView
/// or other scrolling transitions.
class PageTransition {
  PageTransition(this.page, this.pageIndex);

  /// The page index of the transitioning widget
  final int pageIndex;

  /// The current page
  final double page;

  /// The distance between this page and the current page
  double get delta => (pageIndex - page);

  /// The visibility of this page based on the current page
  double get visibility => 1 - delta.clamp(-1.0, 1.0).abs();

  /// The opposite of visibility
  double get invisibility => delta.clamp(-1.0, 1.0).abs();

  /// An offset based on delta
  double offset(double maxOffset) => delta * maxOffset;
}
