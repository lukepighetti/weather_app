import 'package:intl/intl.dart';

extension DateTimeFormattingX on DateTime {
  String get asHour => DateFormat("j").format(this);
}
