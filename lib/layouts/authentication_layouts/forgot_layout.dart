import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../helper_objects/constants/colors.dart';
import '../../utils/custome_textfield.dart';
import '../../utils/my_elevated_button.dart';
import '../../utils/my_text.dart';

class ForgotLayout extends StatelessWidget {
  const ForgotLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xffFFFFFF),
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Padding(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: context.height * .8.sp),
                Container(
                  padding: EdgeInsets.all(25.sp),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffFF3939),
                        Color(0xffBB171E),
                      ],
                    ),
                  ),
                  child: SvgPicture.asset(
                    "assets/svgs/audio.svg",
                  ),
                ),
                SizedBox(height: context.height * .65.sp),
                MyText(
                  text: "Forgot Password",
                  textScale: 6.75.sp,
                  color: colorBlack,
                  weight: FontWeight.w600,
                ),
                SizedBox(height: context.height * .5.sp),
                MyText(
                  text:
                      "Don’t worry. Enter you Registered email below to receive reset link.",
                  textScale: 5.25.sp,
                  color: colorGrey,
                  maxLines: 5,
                  family: "Mont",
                  weight: FontWeight.w400,
                  align: TextAlign.center,
                ),
                SizedBox(height: context.height * 1.sp),
                CustomTextField(
                  label: "Email Address",
                  hintText: "Your email address",
                  preFixIcon: SvgPicture.asset(
                    "assets/svgs/email.svg",
                  ),
                ),
                SizedBox(height: context.height * .85.sp),
                ElevatedBtn(
                  onPressed: () {},
                  text: MyText(
                    text: "Sign In",
                    weight: FontWeight.w700,
                    textScale: 5.75.sp,
                    color: colorWhite,
                  ),
                ),
              ],
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
        ),
      ),
    );
  }
}
