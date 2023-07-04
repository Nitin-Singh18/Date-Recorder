import 'package:isar/isar.dart';

part 'date_model.g.dart';

@collection
class DateModel {
  Id id = Isar.autoIncrement;

  String? date;
}
