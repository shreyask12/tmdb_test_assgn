String durationToString(int minutes) {
  var d = Duration(minutes: minutes);
  List<String> parts = d.toString().split(':');
  return '${parts[0].padLeft(2, '0')}h ${parts[1].padLeft(2, '0')}m';
}

String converUserScore(num score) {
  return (score * 10).toInt().toString().split('.')[0];
}

String getReleaseYear(String date) {
  return date.split('-').first;
}

// extension MoviesDateConverter on String {
//   DateTime convertMoviesDateFormat() {
//     final date = DateFormat('yyyy-MM-dd hh:mm:ss').parse(this);
//     return date;
//   }
// }

// String convertToPresentableDateFormat(String date) {
//   final dateTime = date.convertMoviesDateFormat();
//   return dateTime.convertToDateMonthYearFormat().toUpperCase();
// }

// extension DateFormatter on DateTime {
//   String convertToDateMonthYearFormat({bool dashNeeded = false}) {
//     final dateFormat =
//         dashNeeded ? DateFormat("dd-MMM-yyyy") : DateFormat("dd MMM yyyy");
//     return dateFormat.format(this);
//   }
// }
