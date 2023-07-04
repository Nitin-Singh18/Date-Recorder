import 'package:date_recorder/data/widgets/custom_button.dart';
import 'package:date_recorder/data/widgets/date_picker.dart';
import 'package:date_recorder/data/widgets/overlay_widgets.dart';
import 'package:date_recorder/modules/home/controller/home_controller.dart';
import 'package:date_recorder/services/local/db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
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
  // late Stream<List<DateModel>>
  // List<DateModel> dateRecords = [];

  @override
  void initState() {
    super.initState();
    _homeController.fetchDates(widget.isar, () {
      setState(() {});
    });
    // setState(() {});
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
              itemCount: _homeController.dateRecords.length,
              itemBuilder: (context, index) {
                final dateRecord = _homeController.dateRecords[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Tile(
                    dateRecord: dateRecord,
                    isar: widget.isar,
                    setStateCallBack: () async {
                      await showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => dialog(
                          context,
                          () {
                            _homeController.deleteDate(dateRecord, widget.isar);
                          },
                        ),
                      );
                      setState(() {});
                    },
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
                return bottomSheet(context, widget.isar, () async {
                  await _homeController.addDate(
                    widget.isar,
                  );
                  setState(() {});
                  Navigator.pop(context);
                }, () async {
                  final date = await pickedDateDialog(context, widget.isar);
                  if (date != null) {
                    await _homeController.addSelectedDate(
                        widget.isar, DateFormat.yMMMEd().format(date));
                  }
                  setState(() {});
                  Navigator.pop(context);
                });
              },
            );
          },
        ),
      ),
    );
  }
}
