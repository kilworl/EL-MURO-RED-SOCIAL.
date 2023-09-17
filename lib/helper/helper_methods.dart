// return a formatted data as a string

import 'package:cloud_firestore/cloud_firestore.dart';

String formatDate(Timestamp timestamp) {
  DateTime datetime = timestamp.toDate();

  String year = datetime.year.toString();

  String month = datetime.month.toString();

  String day = datetime.day.toString();

  //final formatted date

  String formattedDate = '$day/$month/$year';

  return formattedDate;
}
