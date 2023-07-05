import 'package:date_recorder/data/model/date_model.dart';
import 'package:date_recorder/services/local/db.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';

class HomeController {
  final _isarDB = DB();
  List<DateModel> dateRecords = [];

  //function to add current date
  Future<void> addDate(Isar isar, snackbarCallBack) async {
    final String date = DateFormat.yMMMEd().format(DateTime.now());

    final bool isDuplicate = dateRecords.any((element) => element.date == date);
    if (!isDuplicate) {
      final id = await _isarDB.insertDateRecord(date, isar);
      final DateModel newDateRecord = DateModel()
        ..id = id
        ..date = date;
      dateRecords.insert(0, newDateRecord);
    } else {
      snackbarCallBack();
    }
  }

  //function to add selected date
  Future<void> addSelectedDate(Isar isar, String date, snackbarCallBack) async {
    final bool isDuplicate = dateRecords.any((element) => element.date == date);
    if (!isDuplicate) {
      final id = await _isarDB.insertDateRecord(date, isar);
      final DateModel newDateRecord = DateModel()
        ..id = id
        ..date = date;
      dateRecords.insert(0, newDateRecord);
    } else {
      snackbarCallBack();
    }
  }

  //function to delete a date
  deleteDate(DateModel dateRecord, Isar isar) {
    _isarDB.deleteRecord(dateRecord.id, isar);
    dateRecords.remove(dateRecord);
  }

  void fetchDates(Isar isar, VoidCallback setStateCallBack) async {
    dateRecords = await _isarDB.getDateRecord(isar);
    dateRecords = dateRecords.reversed.toList();
    setStateCallBack();
  }
}
