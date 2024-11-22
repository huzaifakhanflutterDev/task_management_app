import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:task_management_app/helper_objects/constants/colors.dart';
import 'package:task_management_app/helper_objects/controllers/authentication_controller.dart';
import 'package:task_management_app/layouts/authentication_layouts/signup_layout.dart';
import 'package:task_management_app/utils/custome_textfield.dart';
import 'package:task_management_app/utils/my_elevated_button.dart';
import 'package:task_management_app/utils/my_text.dart';
import 'package:task_management_app/utils/show_my_snack_bar.dart';

import '../../screens/home_navigation_screen.dart';
import 'forgot_layout.dart';

class LoginLayout extends StatelessWidget {
  const LoginLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthenticationController());
    var click = Rx(false);
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xffFFFFFF),
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
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
                    text: "Sign In to your account",
                    textScale: 6.75.sp,
                    color: colorBlack,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: context.height * .5.sp),
                  MyText(
                    text:
                        "Enter your information below or continue with  account",
                    textScale: 5.25.sp,
                    color: colorGrey,
                    maxLines: 5,
                    family: "Mont",
                    weight: FontWeight.w400,
                    align: TextAlign.center,
                  ),
                  SizedBox(height: context.height * .6.sp),
                  CustomTextField(
                    controller: controller.emailController,
                    label: "Email Address",
                    hintText: "Your email address",
                    preFixIcon: SvgPicture.asset(
                      "assets/svgs/email.svg",
                    ),
                  ),
                  Obx(
                    () {
                      return CustomTextField(
                        controller: controller.passwordController,
                        obscureText: click.value,
                        isPassword: true,
                        label: "Password",
                        hintText: "Enter your password",
                        preFixIcon: SvgPicture.asset(
                          "assets/svgs/password.svg",
                        ),
                        sufFixIcon: GestureDetector(
                          onTap: () {
                            click.value = !click.value;
                          },
                          child: SvgPicture.asset(
                            "assets/svgs/eye.svg",
                          ),
                        ),
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () {
                        Get.to(() => ForgotLayout());
                      },
                      child: MyText(
                        text: "Forgot Password",
                        color: colorBlack,
                        textScale: 5.sp,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: context.height * .575.sp),
                  Obx(() {
                    return ElevatedBtn(
                      loading: controller.logLoading.value,
                      onPressed: () async {
                        var response = await controller.loginMethod();
                        if (response == "success") {
                          Get.offAll(() => HomeNavigationScreen());
                          showMySnackBar("User successfully Logged in");
                        } else {
                          showMySnackBar(response);
                        }
                      },
                      text: MyText(
                        text: "Sign In",
                        weight: FontWeight.w700,
                        textScale: 5.75.sp,
                        color: colorWhite,
                      ),
                    );
                  }),
                  SizedBox(height: context.height * .65.sp),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(
                            color: colorBlack,
                            fontSize: 16.5.sp,
                            fontFamily: "Mont",
                          ),
                        ),
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                            color: colorRed,
                            fontFamily: "Mont",
                            fontWeight: FontWeight.w600,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(() => SignupLayout());
                            },
                        ),
                      ],
                    ),
                  ).paddingOnly(bottom: 22.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: context.width * 2.5.sp,
                        height: 3.5.sp,
                        color: colorBlack,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "OR",
                          style: TextStyle(
                            color: colorBlack,
                          ),
                        ),
                      ),
                      Container(
                        width: context.width * 2.5.sp,
                        height: 3.5.sp,
                        color: colorBlack,
                      ),
                    ],
                  ),
                  //Login with Google or Apple
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      2,
                      (index) {
                        var images = [
                          "assets/svgs/google.svg",
                          "assets/svgs/apple.svg",
                        ];
                        return InkWell(
                          onTap: () async {
                            var response = await controller.googleSignIn();
                            if (response == "success") {
                              Get.offAll(() => HomeNavigationScreen());
                              showMySnackBar("User successfully Logged in");
                            } else {
                              showMySnackBar(response);
                            }
                          },
                          child: _buildContainerForLoginWith(
                            index,
                            images[index],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContainerForLoginWith(int index, String svg) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 25.sp,
        horizontal: 12.sp,
      ),
      height: 80,
      width: 110,
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(16.sp),
        boxShadow: [
          BoxShadow(
            color: Color(0xffCCCCCC).withOpacity(.4),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Center(
        child: SvgPicture.asset(
          svg,
          height: 40,
        ),
      ),
    );
  }
}
