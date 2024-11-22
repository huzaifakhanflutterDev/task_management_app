import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:task_management_app/helper_objects/constants/colors.dart';
import 'package:task_management_app/utils/custome_textfield.dart';
import 'package:task_management_app/utils/my_text.dart';

import '../../utils/my_elevated_button.dart';

class PersonalDetailsItem extends StatelessWidget {
  const PersonalDetailsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: MyText(
          text: "Personal Details",
          textScale: 6.sp,
          weight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: context.height * 2.2.sp,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffF51F1F).withOpacity(.5),
                        Color(0xffFFF1F1),
                      ],
                    ),
                    color: Colors.red[200],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100.sp),
                      bottomRight: Radius.circular(100.sp),
                    ),
                  ),
                ),
                SizedBox(height: context.height * 1.25.sp),
                MyText(
                  text: "Mustafa Afridi",
                  weight: FontWeight.w700,
                  textScale: 6.sp,
                  family: "Mont",
                ),
                MyText(
                  text: "Mustafa123445@gmail.com",
                  weight: FontWeight.w400,
                  textScale: 5.sp,
                  family: "Mont",
                ),
                _buildTextFieldColumn(context)
                    .paddingSymmetric(horizontal: context.width * 1.15.sp),
                SizedBox(height: context.height * .65.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    2,
                    (index) {
                      var texts = [
                        "Cancel",
                        "Save",
                      ];
                      return ElevatedBtn(
                        beginColor: index == 0 ? colorWhite : Color(0xffED1E27),
                        endColor: index == 0 ? colorWhite : Color(0xffBB171E),
                        color: colorWhite,
                        radius: 30.sp,
                        isGradientBorder: index == 0 ? true : false,
                        needOfGradient: index == 0
                            ? [
                                Color(0xffED1E27),
                                Color(0xffBB171E),
                              ]
                            : [],
                        onPressed: () {},
                        text: MyText(
                          text: texts[index],
                          color: index == 0 ? colorRed : colorWhite,
                          textScale: 5.5.sp,
                          weight: FontWeight.w700,
                        ).paddingSymmetric(
                          horizontal:
                              index == 0 ? 30.sp : context.width * 1.5.sp,
                        ),
                        borderColor:
                            index == 0 ? Color(0xffBB171E) : Color(0xffED1E27),
                        isShadow: true,
                      ).paddingSymmetric(horizontal: 13.sp);
                    },
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: 37.sp,
                backgroundImage:
                    NetworkImage("https://picsum.photos/200/?random=12"),
              ),
            ).paddingOnly(top: context.height * 1.65.sp),
            SvgPicture.asset("assets/svgs/edit.svg").paddingOnly(
              top: context.height * 2.35.sp,
              left: context.width * 3.4.sp,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldColumn(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.height * .65.sp),
        CustomTextField(
          preFixIcon: SvgPicture.asset("assets/svgs/person.svg"),
          label: "Username",
          controller: TextEditingController(
            text: "Mustafa Afridi",
          ),
          sufFixIcon: SvgPicture.asset("assets/svgs/pen.svg"),
        ),
        CustomTextField(
          preFixIcon: SvgPicture.asset("assets/svgs/email.svg"),
          label: "Email Address",
          controller: TextEditingController(
            text: "Mustafa123445@gmail.com",
          ),
          sufFixIcon: SvgPicture.asset("assets/svgs/pen.svg"),
        ),
        CustomTextField(
          preFixIcon: SvgPicture.asset("assets/svgs/password.svg"),
          label: "Password",
          controller: TextEditingController(
            text: "123456",
          ),
          sufFixIcon: SvgPicture.asset("assets/svgs/pen.svg"),
        ),
        SizedBox(height: context.height * .65.sp),
      ],
    );
  }
}
