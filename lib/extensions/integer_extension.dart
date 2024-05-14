extension IntegerParsing on int {
  String totalTimeToString() {
    Duration duration = Duration(seconds: this);
    String formattedTime = '${duration.inHours.toString().padLeft(2, '0')}:'
        '${(duration.inMinutes % 60).toString().padLeft(2, '0')}:'
        '${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
    return formattedTime;
  }

  String getDayLabel() {
    switch (this) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  String getMonthLabel() {
    String monthName = '';
    switch (this) {
      case 1:
        monthName = 'Jan';
        break;
      case 2:
        monthName = 'Feb';
        break;
      case 3:
        monthName = 'Mar';
        break;
      case 4:
        monthName = 'Apr';
        break;
      case 5:
        monthName = 'May';
        break;
      case 6:
        monthName = 'Jun';
        break;
      case 7:
        monthName = 'Jul';
        break;
      case 8:
        monthName = 'Aug';
        break;
      case 9:
        monthName = 'Sep';
        break;
      case 10:
        monthName = 'Oct';
        break;
      case 11:
        monthName = 'Nov';
        break;
      case 12:
        monthName = 'Dec';
        break;
      default:
        monthName = 'Invalid month';
        break;
    }
    return monthName;
  }

  String getRpeSvgAsset() {
    String rpe;
    int rpePoint = this;
    if (rpePoint == 10) {
      rpe = '10';
    } else if (rpePoint == 9) {
      rpe = '9';
    } else if (rpePoint >= 7 && rpePoint <= 8) {
      rpe = '7-8';
    } else if (rpePoint >= 4 && rpePoint <= 6) {
      rpe = '4-6';
    } else if (rpePoint >= 2 && rpePoint <= 3) {
      rpe = '2-3';
    } else if (rpePoint == 1) {
      rpe = '1';
    } else {
      rpe = 'Invalid RPE Point';
    }
    return rpe;
  }
}
