import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'my_text.dart';

void showMySnackBar(String message) {
  ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(
      content: MyText(
        text: message,
        textScale: 5.sp,
        color: Color(0xffFFFFFFF),
      ),
    ),
  );
}
