import 'package:date_recorder/const/app_colors.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:isar/isar.dart';

import 'custom_button.dart';

Widget dialog(BuildContext context, deleteCallBack) {
  return AlertDialog(
    backgroundColor: AppColor.backGroundColor,
    title: const Text(
      'Are you sure you want to delete this entry?',
      style: TextStyle(color: AppColor.mainColor),
    ),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.r),
        side: const BorderSide(color: AppColor.mainColor, width: 2)),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          deleteCallBack();
          Navigator.pop(context, 'Yes');
        },
        child: const Text(
          'Yes',
          style: TextStyle(color: Colors.red),
        ),
      ),
      TextButton(
        onPressed: () => Navigator.pop(context, 'Cancel'),
        child: const Text(
          'Cancel',
          style: TextStyle(color: AppColor.mainColor),
        ),
      ),
    ],
  );
}

Widget bottomSheet(
    BuildContext context, Isar isar, setStateCallBack, selectDateCallBack) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 20.w,
    ),
    child: SizedBox(
      height: 140.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Button(
              title: "Add Today",
              ontap: () {
                setStateCallBack();
              }),
          Button(
              title: "Select Date",
              ontap: () {
                selectDateCallBack();
              })
        ],
      ),
    ),
  );
}
