class DateTimeConverterUtil {

  /// This function was created by Paul.
  ///
  /// start param format : 2022-10-31 11:26:18.017 (DateTime.now() 사용 시 나오는 포맷.)
  ///
  /// end param format : 2022-10-31 11:26:18
  String convertDateTimeToMinutesAgo(DateTime start, DateTime end) {
    Duration difference = start.difference(end);
    int differenceDay = difference.inDays;
    int differenceHours = difference.inHours;
    int differenceMinutes = difference.inMinutes;

    if(differenceDay >= 3) {
      if (start.year == end.year)
        return '${end.month}월 ${end.day}일';
      else
        return '${end.year}년 ${end.month}월 ${end.day}일';
    }

    if(differenceDay >= 1) return '$differenceDay일 전';

    if(differenceMinutes > 59) return '$differenceHours시간 전';

    if(differenceMinutes >= 3)
      return '$differenceMinutes분 전';
    else
      return "방금 전";
  }

}