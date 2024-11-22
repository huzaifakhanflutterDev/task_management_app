import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:task_management_app/helper_objects/controllers/navigation_controller.dart';

import '../utils/my_text.dart';

class HomeNavigationScreen extends StatelessWidget {
  const HomeNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(NavigationController());

    return Scaffold(
      body: Obx(
        () {
          return controller.listOfScreens
              .elementAt(controller.selectedIndex.value);
        },
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.sp),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffED1E27),
              Color(0xffBB171E),
            ],
          ),
          borderRadius: BorderRadius.circular(20.sp),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            5,
            (index) {
              var images = [
                'assets/svgs/home.svg',
                'assets/svgs/notes.svg',
                'assets/svgs/tasks.svg',
                'assets/svgs/category.svg',
                'assets/svgs/settings.svg',
              ];
              var names = [
                "Home",
                "Notes",
                "Tasks",
                "Category",
                "Settings",
              ];
              return Obx(
                () {
                  return GestureDetector(
                    onTap: () {
                      controller.toggleIndex(index);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          images[index],
                          color: controller.selectedIndex.value == index
                              ? Color(0xffFFFFFF)
                              : Color(0xffFFFFFF).withOpacity(.5),
                        ),
                        MyText(
                          weight: controller.selectedIndex.value == index
                              ? FontWeight.w600
                              : FontWeight.w400,
                          textScale: 4.65.sp,
                          text: names[index],
                          color: controller.selectedIndex.value == index
                              ? Color(0xffFFFFFF)
                              : Color(0xffFFFFFF).withOpacity(.5),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ).paddingSymmetric(vertical: 12.sp),
      ),
    );
  }
}
