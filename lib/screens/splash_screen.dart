import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:task_management_app/screens/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 5),
      () {
        Get.offAll(() => OnboardingScreen());
      },
    );
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Color(0xffFF0000),
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarContrastEnforced: true
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffFF7878),
              Color(0xffFF0000),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: context.height * 2.sp,
              ),
              Column(
                children: [
                  SvgPicture.asset("assets/svgs/audio.svg"),
                  Text(
                    "AI Voice Assistant",
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontFamily: "Inter"),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 35.sp,
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballSpinFadeLoader,
                    backgroundColor: Colors.transparent,
                    colors: [Colors.white],
                  ),
                ).paddingSymmetric(vertical: 30.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
