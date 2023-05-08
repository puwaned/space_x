import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String format([String format = 'd MMM yyyy']) {
    return DateFormat(format).format(this);
  }
}
