import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String toPtBrFormat() {
    return DateFormat('dd/MM/yyyy').format(this);
  }
}
