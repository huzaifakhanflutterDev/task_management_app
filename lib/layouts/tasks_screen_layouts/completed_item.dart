import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:task_management_app/helper_objects/constants/colors.dart';

import '../../utils/my_elevated_button.dart';
import '../../utils/my_text.dart';

class CompletedItem extends StatelessWidget {
  const CompletedItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hour = DateFormat("hh:mm aaa").format(DateTime.now()).toString();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 14.sp),
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            4,
            (index) {
              var listOfTitles = [
                "Meeting with Client",
                "Adding Feature",
                "Meeting with Client",
                "Adding Feature",
              ];
              var listOfSubtitles = [
                "Project Management",
                "Game",
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
                  isShadow: true,
                  isHeight: false,
                  onPressed: () {},
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
              icon: Container(
                padding: EdgeInsets.all(6.sp),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff86B726),
                ),
                child: Icon(
                  Icons.check_rounded,
                  color: colorWhite,
                  size: 18.sp,
                ),
              ),
              onPressed: null,
              label: MyText(
                  textScale: 5.25.sp,
                  weight: FontWeight.w600,
                  color: colorBlack,
                  text: "Completed"),
            ),
          ],
        ),
      ),
    );
  }
}
