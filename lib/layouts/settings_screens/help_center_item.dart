import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:task_management_app/utils/my_elevated_button.dart';
import 'package:task_management_app/utils/my_text.dart';

import '../../helper_objects/constants/colors.dart';

class HelpCenterItem extends StatelessWidget {
  const HelpCenterItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: MyText(
          text: "Help Center",
          textScale: 6.sp,
          weight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                color: colorWhite,
                elevation: 10,
                shadowColor: colorGreyLight.withOpacity(.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/svgs/help.svg"),
                    Text(
                      "We’re here to help \nwhenever you need us",
                      textScaler: TextScaler.linear(6.sp),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 4.5.sp,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ).paddingSymmetric(vertical: 16.sp),
                    Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Have a question? Send a message to ",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff6A6A6A),
                            ),
                          ),
                          TextSpan(
                            text: "\nHelp@gmail.com ",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff6A6A6A),
                            ),
                          ),
                          TextSpan(
                            text: "or ",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff6A6A6A),
                            ),
                          ),
                          TextSpan(
                            text: "+12345678911 ",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff6A6A6A),
                            ),
                          ),
                          TextSpan(
                            text: " at any time",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff6A6A6A),
                            ),
                          ),
                        ],
                      ),
                    ),
                    MyText(
                      text: "OR",
                      family: "Mont",
                      color: Color(0xff6A6A6A),
                      textScale: 5.sp,
                      weight: FontWeight.w400,
                      align: TextAlign.center,
                    ).paddingSymmetric(vertical: 12.sp),
                    MyText(
                      text: "send us a message directly below.",
                      family: "Mont",
                      textScale: 5.sp,
                      color: Color(0xff6A6A6A),
                      weight: FontWeight.w400,
                      align: TextAlign.center,
                    ),
                    SizedBox(height: context.height * .5.sp),
                  ],
                ),
              ),
            ),
            MyText(
              text: "Write Message",
              family: "Mont",
              textScale: 5.5.sp,
              weight: FontWeight.w600,
              align: TextAlign.center,
            ).paddingSymmetric(vertical: 12.sp),
            TextFormField(
              maxLines: 8,
              decoration: InputDecoration(
                hintText: "Write Something.....",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.sp),
                  borderSide: BorderSide(
                    color: Color(0xffE6E6E6).withOpacity(.2),
                    width: .7,
                  ),
                ),
              ),
            ),
            SizedBox(height: context.height * 1.sp),
            ElevatedBtn(
              onPressed: () {},
              text: MyText(
                text: "Send Message",
                weight: FontWeight.w700,
                textScale: 5.75.sp,
                color: colorWhite,
              ),
            ).paddingSymmetric(horizontal: 25.sp),
          ],
        ),
      ),
    );
  }
}
