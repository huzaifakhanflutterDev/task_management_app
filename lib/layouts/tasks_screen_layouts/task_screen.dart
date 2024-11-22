import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:task_management_app/layouts/tasks_screen_layouts/completed_item.dart';
import 'package:task_management_app/layouts/tasks_screen_layouts/pending_item.dart';

import '../../helper_objects/constants/colors.dart';
import '../../utils/my_text.dart';
import 'upcoming_item.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: MyText(
            text: "Tasks",
            textScale: 5.9.sp,
            color: colorBlack,
            weight: FontWeight.w600,
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromRadius(20.sp),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12.sp),
              padding: EdgeInsets.all(8.sp),
              height: 28.sp,
              decoration: BoxDecoration(
                color: Color(0xffFFEFEF),
                borderRadius: BorderRadius.circular(15.sp),
              ),
              child: TabBar(
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffED1E27),
                      Color(0xffBB171E),
                    ],
                  ),
                ),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color(0xffE91D26),
                  fontSize: 16.sp,
                  fontFamily: "Mont",
                ),
                labelStyle: TextStyle(
                  fontFamily: "Mont",
                  fontWeight: FontWeight.w700,
                  color: Color(0xffFFFFFF),
                  fontSize: 16.sp,
                ),
                tabs: List.generate(
                  3,
                  (index) {
                    var tabs = [
                      "Upcoming",
                      "Pending",
                      "Completed",
                    ];
                    return Tab(
                      text: tabs[index],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            UpcomingItem(),
            PendingItem(),
            CompletedItem(),
          ],
        ),
      ),
    );
  }
}
