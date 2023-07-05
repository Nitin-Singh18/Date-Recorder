import 'package:date_recorder/const/app_colors.dart';

import 'package:flutter/material.dart';

import 'package:isar/isar.dart';

Future<DateTime?> pickedDateDialog(BuildContext context, Isar isar) async {
  return showDatePicker(
    builder: (context, child) {
      return Theme(
          data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
            primary: AppColor.mainColor,
            onPrimary: Colors.black,
            onSurface: Colors.black,
          )),
          child: child!);
    },
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2022, 12, 1),
    lastDate: DateTime(2024, 1, 31),
  );
}
