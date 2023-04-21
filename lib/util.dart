import 'package:intl/intl.dart';

extension CustomDateTimeToString on DateTime {
  String toCustomString() {
    final dayOfWeek = DateFormat('EEEE').format(this);
    final month = DateFormat('MMMM').format(this);
    final date = DateFormat('d').format(this);
    return '$dayOfWeek $month, $date';
  }
}
