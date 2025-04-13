import 'package:intl/intl.dart';

import '../utils/path_provider.dart';

String formatDate(String format, String day) {
  DateTime data = DateFormat(date).parse(day);
  return DateFormat(format).format(data);
}
