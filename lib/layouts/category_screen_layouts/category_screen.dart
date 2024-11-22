import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:task_management_app/utils/my_elevated_button.dart';

import '../../helper_objects/constants/colors.dart';
import '../../utils/my_text.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: "Category",
          textScale: 5.9.sp,
          color: colorBlack,
          weight: FontWeight.w600,
        ),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          var names = [
            "Project Management",
            "Game",
            "Estimation",
            "Personal",
          ];
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.sp,
              vertical: 18.sp,
            ),
            margin: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 10.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.sp),
              border: Border.all(
                color: Color(0xffE6E6E6),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  text: names[index],
                  textScale: 5.75.sp,
                  weight: FontWeight.w500,
                  family: "Mont",
                ),
                SvgPicture.asset(
                  "assets/svgs/delete.svg",
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: colorWhite,
            builder: (context) {
              return Container(
                height: context.height * 2.6.sp,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.sp),
                  child: Column(
                    children: [
                      SizedBox(height: context.height * .75.sp),
                      MyText(
                        text: "Add New Category",
                        textScale: 7.sp,
                        weight: FontWeight.w600,
                      ),
                      Divider(
                        height: context.height * .5.sp,
                        color: colorBlack,
                      ).paddingSymmetric(horizontal: 18.sp),
                      SizedBox(height: context.height * .5.sp),
                      Align(
                        alignment: Alignment.topLeft,
                        child: MyText(
                          text: "Category Name",
                          textScale: 5.25.sp,
                          color: colorBlack,
                          weight: FontWeight.w600,
                        ),
                      ).paddingOnly(bottom: 12.sp),
                      TextFormField(
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText: "Write Something.....",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.sp),
                            borderSide: BorderSide(
                              color: Color(0xff686D76).withOpacity(.15),
                              width: .7,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: context.height * .75.sp),
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
                              beginColor:
                                  index == 0 ? colorWhite : Color(0xffED1E27),
                              endColor:
                                  index == 0 ? colorWhite : Color(0xffBB171E),
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
        child: Container(
          padding: EdgeInsets.all(15.sp),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffED1E27),
                Color(0xffBB171E),
              ],
            ),
          ),
          child: Text(
            String.fromCharCode(
              Icons.add_rounded.codePoint,
            ),
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: colorWhite,
              fontSize: 23.sp,
              inherit: false,
              fontFamily: Icons.arrow_forward_ios_rounded.fontFamily,
              package: Icons.arrow_forward_ios_rounded.fontPackage,
            ),
          ),
        ),
      ),
    );
  }
}
