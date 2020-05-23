import 'package:intl/intl.dart';

extension DateTimeFormattingX on DateTime {
  String get asHour => DateFormat("j").format(this);
  String get ashhmm => DateFormat("h:mm").format(this);
}
