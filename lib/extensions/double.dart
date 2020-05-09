/// Enables us to convert Kelvin to fahrenheit or celsius
extension TemperatureConversionsX on num {
  /// Convert kelvin to fahrenheit
  static double _k2f(double kelvin) => kelvin * 9 / 5 - 459.67;

  /// Convert fahrenheit to celsius
  static double _f2c(double fahrenheit) => (fahrenheit - 32) / (9 / 5);

  double get asFahrenheit => _k2f(this);
  double get asCelsius => _f2c(_k2f(this));
}
