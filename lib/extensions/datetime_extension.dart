import 'package:intl/intl.dart';

extension DateTimeFormat on DateTime {
  String dateTimeFormat() {
    String outputFormat = 'M/d/yyyy | h:mm a';

    DateFormat dateFormat = DateFormat(outputFormat);

    String formattedDateTime = dateFormat.format(this);
    return formattedDateTime;
  }

  String toDayAndMonthString() {
    return '$day/$month';
  }

  String dateTimeFormatWithStringMonth() {
    String pattern = 'd MMMM yyyy';

    DateFormat dateFormat = DateFormat(pattern);

    return dateFormat.format(this);
  }
}
