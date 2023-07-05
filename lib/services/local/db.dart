import 'package:date_recorder/data/model/date_model.dart';
import 'package:isar/isar.dart';

class DB {
  Future<int> insertDateRecord(String date, Isar isar) async {
    final dateRecord = DateModel()..date = date;
    late final int id;
    await isar.writeTxn(
      () async {
        id = await isar.dateModels.put(dateRecord);
      },
    );
    return id;
  }

  Future<List<DateModel>> getDateRecord(Isar isar) {
    final dataRecords = isar.dateModels.where().findAll();

    return dataRecords;
  }

  void deleteRecord(int id, Isar isar) async {
    await isar.writeTxn(() async {
      await isar.dateModels.delete(id);
    });
  }
}
