import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String toPtBrFormat() {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  String toEnUsFormat() {
    return DateFormat('yyyy-MM-dd').format(this);
  }
}
