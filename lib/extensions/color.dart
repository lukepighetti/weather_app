import 'package:flutter/widgets.dart';

extension ColorOpacityX on Color {
  Color get opacity50 => this.withOpacity(50 / 1000);
  Color get opacity100 => this.withOpacity(100 / 1000);
  Color get opacity200 => this.withOpacity(200 / 1000);
  Color get opacity300 => this.withOpacity(300 / 1000);
  Color get opacity400 => this.withOpacity(400 / 1000);
  Color get opacity500 => this.withOpacity(500 / 1000);
  Color get opacity600 => this.withOpacity(600 / 1000);
  Color get opacity700 => this.withOpacity(700 / 1000);
  Color get opacity800 => this.withOpacity(800 / 1000);
  Color get opacity900 => this.withOpacity(900 / 1000);
}
