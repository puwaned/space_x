import 'package:intl/intl.dart';

extension DateExtension on DateTime? {
  String format([String format = 'd MMM yyyy']) {
    if (this == null) return '-';
    return DateFormat(format).format(this!);
  }
}
