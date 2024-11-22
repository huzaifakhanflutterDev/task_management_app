import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MyListTile extends StatelessWidget {
  Color bgcolor;
  String? leading;
  String title;
  String subtitle;
  Widget trailing;

  MyListTile({
    this.leading = "",
    required this.bgcolor,
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgcolor,
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.center,
        contentPadding: EdgeInsets.symmetric(horizontal: 6.sp),
        leading: Container(
          height: context.height * .06,
          child: Image.asset(leading!),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12.65.sp,
            color: Color(0xffFFFFFF),
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 10.sp,
            color: Color(0xffB3B3B3),
            fontFamily: "Jakarta",
          ),
        ),
        trailing: trailing,
      ),
    ).paddingSymmetric(vertical: 0.sp);
  }
}
