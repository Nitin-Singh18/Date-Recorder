import 'package:date_recorder/data/model/date_model.dart';
import 'package:date_recorder/data/widgets/custom_button.dart';
import 'package:date_recorder/data/widgets/overlay_widgets.dart';
import 'package:date_recorder/modules/home/controller/home_controller.dart';
import 'package:date_recorder/services/local/db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isar/isar.dart';

import '../../../const/app_colors.dart';
import '../../../data/widgets/tile.dart';

class HomeScreen extends StatefulWidget {
  final Isar isar;
  const HomeScreen({super.key, required this.isar});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _homeController = HomeController();
  final isarDB = DB();
  List<DateModel> dateRecords = [];

  @override
  void initState() {
    super.initState();
    getRecords();
  }

  void getRecords() async {
    dateRecords = await _homeController.fetchDates(widget.isar);
    setState(() {});
  }

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
              itemCount: dateRecords.length,
              itemBuilder: (context, index) {
                final dateRecord = dateRecords[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Tile(
                    dateRecord: dateRecord,
                  ),
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
                return bottomSheet(context, widget.isar);
              },
            );
          },
        ),
      ),
    );
  }
}
