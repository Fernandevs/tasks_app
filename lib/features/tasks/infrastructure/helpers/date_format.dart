import 'package:intl/intl.dart';

String dateFormat(DateTime inputDate) {
  final inputFormat = DateFormat('dd/MM/yyyy');
  return inputFormat.format(inputDate);
}
