import 'package:intl/intl.dart';

class DataConvert {
  static String minutesFromSeconds(int seconds) {
    Duration duration = Duration(seconds: seconds);
    String formattedTime = '${duration.inHours.toString().padLeft(2, '0')}:'
        '${(duration.inMinutes % 60).toString().padLeft(2, '0')}:'
        '${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
    return formattedTime;
  }

  static String dateTimeFormatWithStringMonth(DateTime dateTime) {
    String pattern = 'd MMMM yyyy';

    DateFormat dateFormat = DateFormat(pattern);

    return dateFormat.format(dateTime);
  }

  static String dateTimeFormat(DateTime dateTime) {
    String outputFormat = 'M/d/yyyy | h:mm a';

    DateFormat dateFormat = DateFormat(outputFormat);

    String formattedDateTime = dateFormat.format(dateTime);
    return formattedDateTime;
  }
}
