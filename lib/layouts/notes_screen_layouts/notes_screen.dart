import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:task_management_app/helper_objects/constants/colors.dart';
import 'package:task_management_app/utils/my_elevated_button.dart';
import 'package:task_management_app/utils/my_text.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: "Notes",
          textScale: 5.9.sp,
          color: colorBlack,
          weight: FontWeight.w600,
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 17.sp),
            padding: EdgeInsets.symmetric(
              horizontal: context.width * .35.sp,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.sp),
              border: Border.all(
                color: Color(0xffE8E8E8),
                width: 1,
              ),
            ),
            child: Theme(
              data: ThemeData(
                splashColor: Colors.white,
                hoverColor: Colors.white,
              ),
              child: ExpansionTile(
                tilePadding: EdgeInsets.only(left: 14.sp, right: 8.sp),
                title: MyText(
                  text: "Note ${index + 1}",
                  textScale: 5.75.sp,
                  maxLines: 3,
                  weight: FontWeight.w500,
                ),
                initiallyExpanded: index == 0 ? true : false,
                expandedAlignment: Alignment.topRight,
                shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                ),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text:
                        "Staying focused on cardio can be challenging but sticking to the system can yield great results in terms of endurance and overall fitness levels.",
                    textScale: 5.sp,
                    weight: FontWeight.w400,
                    color: Color(0xff808080),
                    maxLines: 8,
                    align: TextAlign.start,
                  ).paddingSymmetric(
                    horizontal: context.width * .7.sp,
                    vertical: context.width * .5.sp,
                  ),
                ],
              ),
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
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.sp),
                child: Column(
                  children: [
                    SizedBox(height: context.height * .75.sp),
                    MyText(
                      text: "Add New Note",
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
                        text: "Write Note",
                        textScale: 5.25.sp,
                        color: colorBlack,
                        weight: FontWeight.w600,
                      ),
                    ).paddingOnly(bottom: 12.sp),
                    TextFormField(
                      maxLines: 6,
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
