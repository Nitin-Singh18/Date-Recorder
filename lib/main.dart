import 'package:date_recorder/modules/home/screen/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'data/model/date_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [DateModelSchema],
    directory: dir.path,
  );
  runApp(MyApp(
    isar: isar,
  ));
}

class MyApp extends StatelessWidget {
  final Isar isar;
  const MyApp({super.key, required this.isar});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Date Recorder',
          home: HomeScreen(isar: isar),
        );
      },
    );
  }
}
