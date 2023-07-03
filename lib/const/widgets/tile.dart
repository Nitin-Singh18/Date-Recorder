import 'package:date_recorder/const/app_colors.dart';
import 'package:date_recorder/const/widgets/overlay_widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class Tile extends StatelessWidget {
  const Tile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 65.h,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColor.mainColor),
              borderRadius: BorderRadius.circular(6.r)),
          child: Padding(
            padding: EdgeInsets.only(left: 10.0.w, right: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "19 Jan 2023 Thu",
                  style: TextStyle(fontSize: 18.sp, color: AppColor.mainColor),
                ),
                IconButton(
                    onPressed: () {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => dialog(context));
                    },
                    icon: const Icon(
                      Icons.delete_outline_outlined,
                      color: AppColor.mainColor,
                    )),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
