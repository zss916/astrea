import 'package:intl/intl.dart';

class CalculateTools {
  static int calculateAge(String birthDate) {
    DateTime now = DateTime.now();
    DateTime birth = DateFormat('yyyy-MM-dd').parse(birthDate);

    int age = now.year - birth.year;
    if (now.month < birth.month ||
        (now.month == birth.month && now.day < birth.day)) {
      age--;
    }
    return age;
  }

  /// 格式化日期
  static String formattedDate(String inputDate) {
    DateTime dateTime = DateTime.parse(inputDate);
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    return formattedDate;
  }

  /// 格式化日期2000-01-01 1:2
  static String formattedTime(String inputDate) {
    DateTime dateTime = DateTime.parse(inputDate);
    //MMMM d,y.hh:mm a
    String formattedDate = DateFormat('MMMM d,y.').format(dateTime);
    return formattedDate;
  }

  static String formattedTime2(String inputDate) {
    DateTime dateTime = DateTime.parse(inputDate);
    //MMMM d,y.hh:mm a
    String formattedDate = DateFormat('MMMM d,y').format(dateTime);
    return formattedDate;
  }

  /*DateFormat(
            'MMMM d,y.hh:mm a',
              ).format(DateTime.fromMillisecondsSinceEpoch(907363200 * 1000)),*/

  static String formattedAmOrPm(int h) => h > 12 ? "PM" : "AM";
}

extension NumExtension on int {
  String get formatted => NumberFormat('00').format(this);
}
