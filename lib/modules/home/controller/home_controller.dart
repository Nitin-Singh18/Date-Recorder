import 'package:date_recorder/data/model/date_model.dart';
import 'package:date_recorder/services/local/db.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';

class HomeController {
  final _isarDB = DB();
  void addDate(
    Isar isar,
  ) async {
    final String date = DateFormat.yMMMEd().format(DateTime.now());
    _isarDB.insertDateRecord(date, isar);
  }

  void addSelectedDate(
    Isar isar,
    String date,
  ) async {
    _isarDB.insertDateRecord(date, isar);
    date = '';
  }

  Future<List<DateModel>> fetchDates(Isar isar) async {
    List<DateModel> dateRecords;
    dateRecords = await _isarDB.getDateRecord(isar);
    return dateRecords;
  }
}
