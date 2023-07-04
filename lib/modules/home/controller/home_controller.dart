import 'package:date_recorder/data/model/date_model.dart';
import 'package:date_recorder/services/local/db.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';

class HomeController {
  final _isarDB = DB();
  List<DateModel> dateRecords = [];
  Future<void> addDate(Isar isar) async {
    final String date = DateFormat.yMMMEd().format(DateTime.now());
    final id = await _isarDB.insertDateRecord(date, isar);
    dateRecords.add(DateModel()
      ..id = id
      ..date = date);
  }

  Future<void> addSelectedDate(
    Isar isar,
    String date,
  ) async {
    final id = await _isarDB.insertDateRecord(date, isar);
    dateRecords.add(DateModel()
      ..id = id
      ..date = date);
  }

  deleteDate(DateModel dateRecord, Isar isar) {
    _isarDB.deleteRecord(dateRecord.id, isar);
    dateRecords.remove(dateRecord);
  }

  void fetchDates(Isar isar, VoidCallback setStateCallBack) async {
    dateRecords = await _isarDB.getDateRecord(isar);
    setStateCallBack();
  }
}
