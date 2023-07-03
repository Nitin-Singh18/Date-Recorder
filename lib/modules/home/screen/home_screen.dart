import 'package:date_recorder/const/widgets/custom_button.dart';
import 'package:date_recorder/const/widgets/overlay_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/app_colors.dart';
import '../../../const/widgets/tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: const Tile(),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: AppColor.backGroundColor,
        height: 70.h,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        child: Button(
          isIcon: true,
          ontap: () {
            showModalBottomSheet(
              backgroundColor: AppColor.backGroundColor,
              context: context,
              builder: (BuildContext context) {
                return bottomSheet(context);
              },
            );
          },
        ),
      ),
    );
  }
}
