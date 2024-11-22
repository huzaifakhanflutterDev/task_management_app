import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:task_management_app/helper_objects/constants/colors.dart';
import 'package:task_management_app/helper_objects/controllers/onboarding_swiping.dart';
import 'package:task_management_app/utils/my_text.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CarouselSliderController swiperController = CarouselSliderController();

    var listOfImages = [
      "assets/svgs/task.svg",
      "assets/svgs/reminders.svg",
      "assets/svgs/achievements.svg",
    ];
    var listOfTitles = [
      "Effortless Task Management",
      "Smart Reminders ",
      "Track Achievements",
    ];
    var listOfDesc = [
      "Organize your tasks into categories for a clearer view of your priorities and streamline your workflow.",
      "Get timely notifications that help you stay on track and manage your time \neffectively.",
      "Visualize your completed tasks and stay motivated as you see how much \nyou've accomplished!",
    ];
    var controller = Get.put(OnboardingController());
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xffFFFFFF),
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Obx(
              () {
                return CarouselSlider(
                  carouselController: swiperController,
                  items: [0, 1, 2].map(
                    (items) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.width * .75.sp,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // SizedBox(height: context.height * 1.sp),
                            Spacer(
                              flex: 2,
                            ),
                            SvgPicture.asset(
                              listOfImages[items],
                              height: context.height * 2.55.sp,
                            ),
                            Spacer(flex: 2),
                            Text(
                              "${listOfTitles[items]}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                color: colorBlack,
                              ),
                            ),
                            Spacer(),
                            Text(
                              listOfDesc[items],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.5.sp,
                                fontWeight: FontWeight.w500,
                                color: colorGrey,
                              ),
                            ),
                            Spacer(
                              flex: 2,
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                  options: CarouselOptions(
                    height: context.height * 3.65.sp,
                    aspectRatio: 12 / 7,
                    viewportFraction: 1,
                    initialPage: controller.currentPage.value,
                    enableInfiniteScroll: false,
                    onPageChanged: (value, reason) {
                      controller.updatePage(value);
                    },
                  ),
                );
              },
            ),
            Obx(
              () {
                return CircularPercentIndicator(
                  radius: 26.sp,
                  lineWidth: 7.sp,
                  animation: true,
                  animationDuration: 600,
                  percent: controller.progressValue.value,
                  center: GestureDetector(
                    onTap: () {
                      if (controller.currentPage.value == 2) {
                        controller.navigateToNextScreen(context);
                      } else {
                        swiperController.nextPage();
                      }
                    },
                    child: Container(
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
                      child: Text(
                        String.fromCharCode(
                          Icons.arrow_forward_ios_rounded.codePoint,
                        ),
                        style: TextStyle(
                          inherit: false,
                          color: colorWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          fontFamily:
                              Icons.arrow_forward_ios_rounded.fontFamily,
                          package: Icons.arrow_forward_ios_rounded.fontPackage,
                        ),
                      ).paddingAll(17.5.sp),
                    ),
                  ),
                  footer: GestureDetector(
                    onTap: () {
                      if (controller.currentPage.value != 2) {
                        swiperController.jumpToPage(2);
                      } else {
                        controller.navigateToNextScreen(context);
                      }
                    },
                    child: MyText(
                      text: "SKIP",
                      textScale: 5.5.sp,
                      color: colorGreyLight,
                      weight: FontWeight.w600,
                      family: "Inter",
                    ),
                  ).paddingOnly(top: 20.sp),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: colorRed,
                  backgroundColor: Colors.transparent,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
