import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:task_management_app/utils/my_text.dart';

import '../../../helper_objects/constants/colors.dart';

class AddedTaskItem extends StatelessWidget {
  String title, buttonText;

  AddedTaskItem({
    required this.title,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    var click = Rx(false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Mont",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: colorWhite,
                elevation: 10,
                shadowColor: Color(0xffCCCCCC).withOpacity(.2),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13.sp),
                  child: Column(
                    children: [
                      ListTile(
                        horizontalTitleGap: 0,
                        contentPadding: EdgeInsets.zero,
                        title: MyText(
                          text: "Task Details",
                          textScale: 6.sp,
                          weight: FontWeight.w600,
                          color: colorBlack,
                        ),
                        subtitle: MyText(
                          text: "You can edit task details.",
                          textScale: 4.75.sp,
                          spacing: -.1,
                          color: colorBlack,
                          weight: FontWeight.w400,
                        ),
                        trailing: SvgPicture.asset("assets/svgs/pen.svg"),
                      ),
                      Divider(
                        color: Color(0xffE6E6E6),
                      ),
                      Column(
                        children: listOfTask.map(
                          (e) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyText(
                                  text: e['title'].toString(),
                                  textScale: 5.5.sp,
                                  weight: FontWeight.w400,
                                  color: Color(0xff3B3B3B),
                                ),
                                MyText(
                                  text: e['description'].toString(),
                                  textScale: 5.5.sp,
                                  weight: FontWeight.w500,
                                ),
                              ],
                            ).paddingSymmetric(vertical: 15.sp);
                          },
                        ).toList(),
                      ).paddingSymmetric(horizontal: 12.sp),
                      if (buttonText == "Download")
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 14.sp),
                          height: 25.sp,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            border: Border.all(
                              color: Color(0xffE6E6E6),
                            ),
                          ),
                          child: TextButton.icon(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            icon: Icon(
                              Icons.add,
                              size: 18.sp,
                              color: colorBlack,
                            ),
                            onPressed: () {
                              click.value = true;
                              print(click.value);
                            },
                            label: MyText(
                              text: "Add Attachments",
                              textScale: 5.sp,
                              weight: FontWeight.w600,
                            ),
                          ),
                        ),
                      Obx(() {
                        return Stack(
                          children: click.value == true
                              ? [
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(vertical: 12.sp),
                                    height: 25.sp,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
                                      color: Color(0xff8596FF),
                                    ),
                                    child: TextButton.icon(
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                      ),
                                      icon: Icon(
                                        Icons.file_upload_outlined,
                                        size: 18.sp,
                                        color: colorWhite,
                                      ),
                                      onPressed: () {},
                                      label: MyText(
                                        text: "Add Notes",
                                        textScale: 5.sp,
                                        color: colorWhite,
                                        weight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      click.value = false;
                                    },
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        padding: EdgeInsets.all(6.sp),
                                        decoration: BoxDecoration(
                                          color: Color(0xff464646),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.close,
                                          color: colorWhite,
                                          size: 15.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                              : [],
                        );
                      }),
                    ],
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                label: MyText(
                  text: "Mark as Completed",
                  textScale: 5.sp,
                  weight: FontWeight.w600,
                  color: colorBlack,
                ),
                icon: Container(
                  padding: EdgeInsets.all(8.sp),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorRed,
                  ),
                  child: Text(
                    String.fromCharCode(
                      Icons.done_rounded.codePoint,
                    ),
                    style: TextStyle(
                      fontFamily: Icons.done_rounded.fontFamily,
                      fontWeight: FontWeight.w900,
                      color: colorWhite,
                    ),
                  ),
                ),
              ),
              SizedBox(height: context.height * .65.sp),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.sp),
                  color: buttonText == "Download" ? Color(0xff3742FA) : null,
                  gradient: buttonText != 'Download'
                      ? LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xffED1E27),
                            Color(0xffBB171E),
                          ],
                        )
                      : null,
                ),
                child: TextButton.icon(
                  onPressed: () {},
                  icon: buttonText == "Download"
                      ? Icon(
                          Icons.file_download_outlined,
                          size: 20.sp,
                          color: colorWhite,
                        )
                      : null,
                  label: MyText(
                    text: buttonText,
                    textScale: 5.5.sp,
                    color: colorWhite,
                    weight: FontWeight.w600,
                  ),
                ),
              ).paddingSymmetric(
                horizontal: 20.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

var listOfTask = [
  {
    "title": "Project Name",
    "description": "Meeting with Client",
  },
  {
    "title": "Task Name",
    "description": "Meeting",
  },
  {
    "title": "Category",
    "description": "Task Management",
  },
  {
    "title": "Due Date",
    "description": DateFormat("dd-MM-yyyy").format(DateTime.now()),
  },
  {
    "title": "Due Time",
    "description": DateFormat("hh:mm a").format(DateTime.now()),
  },
  {
    "title": "Created Date",
    "description": DateFormat("dd-MM-yyyy").format(DateTime.now()),
  },
  {
    "title": "Status",
    "description": "In Progress",
  },
];
