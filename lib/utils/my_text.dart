import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MyText extends StatelessWidget {
  String text, family;
  double size, textScale, spacing;
  FontWeight weight;
  Color color;
  TextAlign align;
  FontStyle style;
  TextOverflow overflow;
  int? maxLines;
  TextDecoration? decoration;

  MyText({
    this.decoration,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.textScale = 2.75,
    this.family = "Mont",
    this.align = TextAlign.start,
    this.spacing = .1,
    required this.text,
    this.size = 13,
    this.weight = FontWeight.w500,
    this.color = const Color(0xff000000),
    this.style = FontStyle.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      textScaler: TextScaler.linear(textScale),
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        decoration: decoration,
        letterSpacing: spacing,
        fontWeight: weight,
        fontSize: size.sp,
        color: color,
        fontFamily: family,
        fontStyle: style,
      ),
    ).paddingSymmetric(vertical: context.height * .1.sp);
  }
}
