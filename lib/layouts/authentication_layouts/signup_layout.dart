import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:task_management_app/helper_objects/constants/colors.dart';
import 'package:task_management_app/helper_objects/controllers/authentication_controller.dart';
import 'package:task_management_app/layouts/authentication_layouts/login_layout.dart';
import 'package:task_management_app/screens/home_navigation_screen.dart';
import 'package:task_management_app/utils/custome_textfield.dart';
import 'package:task_management_app/utils/my_elevated_button.dart';
import 'package:task_management_app/utils/my_text.dart';
import 'package:task_management_app/utils/show_my_snack_bar.dart';

class SignupLayout extends StatelessWidget {
  const SignupLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var click = Rx(false);
    var controller = Get.put(AuthenticationController());
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
                    text: "Create your account",
                    textScale: 6.75.sp,
                    color: colorBlack,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: context.height * .5.sp),
                  MyText(
                    text:
                        "Enter your information below or continue with account",
                    textScale: 5.25.sp,
                    color: colorGrey,
                    maxLines: 5,
                    family: "Mont",
                    weight: FontWeight.w400,
                    align: TextAlign.center,
                  ),
                  SizedBox(height: context.height * .6.sp),
                  CustomTextField(
                    label: "Username",
                    controller: controller.nameController,
                    hintText: "Your username",
                    preFixIcon: SvgPicture.asset(
                      "assets/svgs/person.svg",
                    ),
                  ),
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
                        label: "Password",
                        isPassword: true,
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
                  SizedBox(height: context.height * .95.sp),
                  Obx(
                    () {
                      return ElevatedBtn(
                        onPressed: () async {
                          var response = await controller.signupMethod();
                          if (response == "success") {
                            Get.offAll(() => HomeNavigationScreen());
                            showMySnackBar(
                              "User successfully signed up",
                            );
                          } else {
                            showMySnackBar(response);
                          }
                        },
                        text: MyText(
                          text: "Sign Up",
                          weight: FontWeight.w700,
                          textScale: 5.75.sp,
                          color: colorWhite,
                        ),
                        loading: controller.loading.value,
                      );
                    },
                  ),
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
                          text: "Sign In",
                          style: TextStyle(
                            color: colorRed,
                            fontFamily: "Mont",
                            fontWeight: FontWeight.w600,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(() => LoginLayout());
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
                          /*onTap: index == 0
                              ? () async {
                                  var response =
                                      await controller.googleSignIn();
                                  if (response == "success") {
                                    Get.offAll(() => HomeNavigationScreen());
                                    showMySnackBar("Google signing In Success");
                                  } else {
                                    showMySnackBar(response);
                                    print(response);
                                  }
                                }
                              : () {},*/
                          onTap: index == 0
                              ? () async {
                                  try {
                                    controller.googleLoading.value = true;
                                    var response =
                                        await controller.googleSignIn();
                                    if (response == "success") {
                                      Get.offAll(() => HomeNavigationScreen());
                                      showMySnackBar(
                                          "Google Sign In Successful");
                                    } else {
                                      showMySnackBar(response);
                                    }
                                  } catch (e) {
                                    showMySnackBar("Error: ${e.toString()}");
                                  } finally {
                                    controller.googleLoading.value = false;
                                  }
                                }
                              : () {
                                    showMySnackBar("Apple Sign In coming soon!");
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
