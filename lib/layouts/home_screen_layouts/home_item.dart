import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../helper_objects/constants/colors.dart';
import '../../utils/my_text.dart';

class HomeItem extends StatelessWidget {
  Map<String, dynamic>? data;

  HomeItem({this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: data!['color'],
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Stack(
        children: [
          SvgPicture.asset(
            data!['image'],
          ).paddingOnly(
            top: 15.sp,
            bottom: 15.sp,
            left: 38.5.sp,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.sp,
              vertical: 12.sp,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: colorWhite,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    data!['image'],
                    height: 22,
                  ).paddingAll(10.sp),
                ),
                MyText(
                  text: data!['category'],
                  textScale: 7.95.sp,
                  weight: FontWeight.w700,
                  color: colorBlack,
                ),
                MyText(
                  text: data!['title'],
                  textScale: 5.35.sp,
                  weight: FontWeight.w600,
                  color: colorBlack,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
