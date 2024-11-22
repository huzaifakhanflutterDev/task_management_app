import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:task_management_app/helper_objects/constants/colors.dart';
import 'package:task_management_app/layouts/settings_screens/help_center_item.dart';
import 'package:task_management_app/utils/my_elevated_button.dart';

import '../../utils/my_text.dart';
import 'personal_details_item.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: "Settings",
          textScale: 5.9.sp,
          color: colorBlack,
          weight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              text: "Customization",
              textScale: 5.75.sp,
              weight: FontWeight.w600,
              family: "Poppin",
            ).paddingOnly(bottom: 5.sp),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(14.sp),
              decoration: BoxDecoration(
                color: Color(0xffFFF1F1),
                borderRadius: BorderRadius.circular(14.sp),
              ),
              child: InkWell(
                onTap: () {
                  Get.to(() => PersonalDetailsItem());
                },
                child: MyText(
                  text: "Personal Details",
                  textScale: 5.25.sp,
                  family: "Poppin",
                ),
              ),
            ).paddingOnly(bottom: 15.sp),
            MyText(
              text: "Account Management",
              textScale: 5.75.sp,
              family: "Poppin",
              weight: FontWeight.w600,
            ).paddingOnly(bottom: 5.sp),
            Container(
              padding: EdgeInsets.all(14.sp),
              decoration: BoxDecoration(
                color: Color(0xffFFF1F1),
                borderRadius: BorderRadius.circular(14.sp),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => HelpCenterItem());
                    },
                    child: MyText(
                      text: "Help Centre",
                      textScale: 5.25.sp,
                      family: "Poppin",
                    ),
                  ),
                  Divider(
                    color: colorRed,
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: colorWhite,
                        builder: (context) {
                          return SizedBox(
                            height: context.height * 2.25.sp,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.sp),
                              child: Column(
                                children: [
                                  SizedBox(height: context.height * .75.sp),
                                  MyText(
                                    text: "Logout",
                                    textScale: 7.sp,
                                    weight: FontWeight.w600,
                                  ),
                                  Divider(
                                    height: context.height * .5.sp,
                                    color: colorBlack,
                                  ).paddingSymmetric(horizontal: 18.sp),
                                  SizedBox(height: context.height * .5.sp),
                                  MyText(
                                    text:
                                        "Are you sure you want to logout from \nthe app?",
                                    textScale: 5.25.sp,
                                    color: colorBlack,
                                    align: TextAlign.center,
                                    weight: FontWeight.w400,
                                  ).paddingOnly(bottom: 12.sp),
                                  SizedBox(height: context.height * .75.sp),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: List.generate(
                                      2,
                                      (index) {
                                        var texts = [
                                          "Cancel",
                                          "Logout",
                                        ];
                                        return ElevatedBtn(
                                          beginColor: index == 0
                                              ? colorWhite
                                              : Color(0xffED1E27),
                                          endColor: index == 0
                                              ? colorWhite
                                              : Color(0xffBB171E),
                                          color: colorWhite,
                                          radius: 30.sp,
                                          isGradientBorder:
                                              index == 0 ? true : false,
                                          needOfGradient: index == 0
                                              ? [
                                                  Color(0xffED1E27),
                                                  Color(0xffBB171E),
                                                ]
                                              : [],
                                          onPressed: () {},
                                          text: MyText(
                                            text: texts[index],
                                            color: index == 0
                                                ? colorRed
                                                : colorWhite,
                                            textScale: 5.5.sp,
                                            weight: FontWeight.w700,
                                          ).paddingSymmetric(
                                            horizontal: index == 0
                                                ? 30.sp
                                                : context.width * 1.5.sp,
                                          ),
                                          borderColor: index == 0
                                              ? Color(0xffBB171E)
                                              : Color(0xffED1E27),
                                          isShadow: true,
                                        ).paddingSymmetric(horizontal: 13.sp);
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: MyText(
                      text: "Logout",
                      textScale: 5.25.sp,
                      family: "Poppin",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
