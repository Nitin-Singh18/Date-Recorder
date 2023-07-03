import 'package:date_recorder/const/app_colors.dart';
import 'package:flutter/material.dart';

Future<void> pickedDateDialog(BuildContext context) async {
  await showDatePicker(
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
          firstDate: DateTime(2019),
          lastDate: DateTime.now())
      .then(
    (pickedDate) {
      if (pickedDate == null) {
        return;
      }
    },
  );
}
