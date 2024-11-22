import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:sizer/sizer.dart';
import 'package:task_management_app/helper_objects/constants/colors.dart';

class ElevatedBtn extends StatelessWidget {
  VoidCallback? onPressed;
  Widget text;
  Color color, borderColor, beginColor, endColor;
  double radius;
  bool? isShadow, isHeight, isGradientBorder, loading;
  List<Color> needOfGradient;

  ElevatedBtn({
    this.loading,
    this.isGradientBorder = false,
    this.needOfGradient = const [Colors.transparent],
    this.beginColor = const Color(0xffED1E27),
    this.endColor = const Color(0xffBB171E),
    this.isHeight = true,
    this.isShadow = false,
    this.borderColor = Colors.transparent,
    this.radius = 14,
    required this.onPressed,
    this.color = const Color(0xffBB171E),
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loading == true ? null : onPressed,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              beginColor,
              endColor,
            ],
          ),
          boxShadow: isShadow == false ? kElevationToShadow[6] : null,
          borderRadius: BorderRadius.circular(radius),
          border: isGradientBorder == true
              ? GradientBoxBorder(
                  gradient: LinearGradient(
                    colors: needOfGradient,
                  ),
                  width: .775,
                )
              : Border.all(
                  color: borderColor,
                  width: .775,
                ),
        ),
        child: Center(
          child: loading == true
              ? CircularProgressIndicator(
                  color: colorWhite,
                ).paddingSymmetric(
                  vertical: isHeight == true ? context.height * .5.sp : 0,
                )
              : text.paddingSymmetric(
                  horizontal: context.width * .00.sp,
                  vertical: isHeight == true ? context.height * .5.sp : 0,
                ),
        ),
      ),
    );
  }
} /* return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        surfaceTintColor: Colors.transparent,
        minimumSize: Size(context.width.sp, context.height * 0.065.sp),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: BorderSide(
            color: borderColor,
          ),
        ),
        elevation: 20,
        shadowColor: colorBlack
      ).copyWith(
        elevation: ButtonStyleButton.allOrNull(15),
      ),
      onPressed: onPressed,
      child:
    );*/
