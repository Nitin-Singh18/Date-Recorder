import 'package:date_recorder/data/model/date_model.dart';
import 'package:isar/isar.dart';

class DB {
  void insertDateRecord(String date, Isar isar) async {
    final dateRecord = DateModel()..date = date;

    await isar.writeTxn(
      () async {
        await isar.dateModels.put(dateRecord);
      },
    );
  }

  Future<List<DateModel>> getDateRecord(Isar isar) {
    final dataRecords = isar.dateModels.where().findAll();

    return dataRecords;
  }

  void deleteRecord(int id, Isar isar) async {
    await isar.dateModels.delete(id);
  }
}
