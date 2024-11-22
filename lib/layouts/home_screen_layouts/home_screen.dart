import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:task_management_app/helper_objects/constants/colors.dart';
import 'package:task_management_app/layouts/home_screen_layouts/add_new_task_items/add_new_task_item.dart';
import 'package:task_management_app/layouts/home_screen_layouts/add_new_task_items/added_task_item.dart';
import 'package:task_management_app/utils/my_elevated_button.dart';
import 'package:task_management_app/utils/my_text.dart';

import 'home_item.dart';
import 'item_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hour = DateFormat("hh:mm aaa").format(DateTime.now()).toString();
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200.sp,
        leading: ListTile(
          title: MyText(
            text: "Welcome",
            textScale: 4.8.sp,
            weight: FontWeight.w400,
            color: colorBlack,
          ),
          subtitle: MyText(
            text: "${FirebaseAuth.instance.currentUser!.displayName}",
            textScale: 6.5.sp,
            color: colorBlack,
            weight: FontWeight.w600,
          ),
        ),
        toolbarHeight: 70,
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.sp),
            padding: EdgeInsets.all(12.sp),
            decoration: BoxDecoration(
              border: Border.all(
                color: colorGrey.withOpacity(.4),
                width: .7,
              ),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              "assets/svgs/search.svg",
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * .65.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Task Summary
              _buildCardLayout(context),
              MyText(
                text: "Today Tasks",
                textScale: 5.85.sp,
                color: colorBlack,
                weight: FontWeight.w600,
              ).paddingSymmetric(
                horizontal: 5.sp,
                vertical: context.height * .4.sp,
              ),

              ...List.generate(
                2,
                (index) {
                  var listOfTitles = [
                    "Meeting with Client",
                    "Adding Feature",
                  ];
                  var listOfSubtitles = [
                    "Project Management",
                    "Game",
                  ];
                  return _buildTodayTaskData(
                    context,
                    hour,
                    listOfTitles[index],
                    listOfSubtitles[index],
                  );
                },
              ),
              SizedBox(height: context.height * .75.sp)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardLayout(BuildContext context) {
    return Card(
      color: colorWhite,
      elevation: 20,
      shadowColor: Color(0xffCCCCCC).withOpacity(.2),
      child: Padding(
        padding: EdgeInsets.all(12.sp),
        child: Column(
          children: [
            ListTile(
              horizontalTitleGap: 0,
              contentPadding: EdgeInsets.zero,
              title: MyText(
                text: "Task Summary",
                textScale: 6.sp,
                weight: FontWeight.w600,
                color: colorBlack,
              ),
              subtitle: MyText(
                text: "Add New Task and manage all projects",
                textScale: 4.6.sp,
                spacing: -.1,
                color: colorBlack,
                weight: FontWeight.w400,
              ),
              trailing: SizedBox(
                height: 25.sp,
                width: context.width * 2.325.sp,
                child: ElevatedBtn(
                  radius: 12.sp,
                  isShadow: true,
                  isHeight: false,
                  onPressed: () {
                    Get.to(
                      () => AddNewTaskItem(),
                    );
                  },
                  text: MyText(
                    text: "Add New Task",
                    weight: FontWeight.w700,
                    textScale: 5.1.sp,
                    color: colorWhite,
                  ),
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: listOfTasks.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 11.sp,
                crossAxisSpacing: 10.sp,
                childAspectRatio: 4.8.sp,
              ),
              itemBuilder: (context, index) {
                return HomeItem(
                  data: listOfTasks[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTodayTaskData(
      BuildContext context, String hour, title, subtitle) {
    return Card(
      color: colorWhite,
      elevation: 20,
      shadowColor: Color(0xffCCCCCC).withOpacity(.2),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 10.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: MyText(
                text: title,
                textScale: 5.65.sp,
                spacing: -.25,
                weight: FontWeight.w600,
                color: colorBlack,
              ),
              subtitle: MyText(
                text: subtitle,
                textScale: 4.8.sp,
                color: colorBlack,
                weight: FontWeight.w400,
              ),
              trailing: SizedBox(
                height: 25.sp,
                width: context.width * 2.25.sp,
                child: ElevatedBtn(
                  radius: 12.sp,
                  isShadow: true,
                  isHeight: false,
                  onPressed: () {
                    Get.to(
                      () => AddedTaskItem(
                        title: "Meeting with Client",
                        buttonText: "Download",
                      ),
                    );
                  },
                  text: MyText(
                    text: "View Detail",
                    weight: FontWeight.w700,
                    textScale: 5.sp,
                    color: colorWhite,
                  ),
                ),
              ),
            ),
            Divider(
              height: 0,
              color: colorGreyLight.withOpacity(0.25),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              icon: SvgPicture.asset("assets/svgs/Time.svg"),
              onPressed: null,
              label: MyText(
                textScale: 5.25.sp,
                weight: FontWeight.w400,
                color: colorBlack,
                text: hour +
                    " - " +
                    (DateFormat("hh:mm aaa").format(
                      DateTime.now().add(
                        Duration(
                          hours: 1,
                        ),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
