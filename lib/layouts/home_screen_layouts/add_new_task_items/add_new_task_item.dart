import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:task_management_app/helper_objects/constants/colors.dart';
import 'package:task_management_app/utils/my_elevated_button.dart';
import 'package:task_management_app/utils/my_text.dart';
import 'package:task_management_app/utils/speech_to_text.dart';

import 'added_task_item.dart';

class AddNewTaskItem extends StatelessWidget {
  const AddNewTaskItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add New Task",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Mont",
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpeechToTextPage(),
              SizedBox(height: context.height * 1.sp),
              ElevatedBtn(
                onPressed: () {
                  Get.to(
                    () => AddedTaskItem(
                      title: "Added Task",
                      buttonText: "Add New Task",
                    ),
                  );
                },
                text: MyText(
                  text: "Add Task",
                  textScale: 5.5.sp,
                  color: colorWhite,
                  weight: FontWeight.w700,
                ),
              ).paddingSymmetric(horizontal: 20.sp),
            ],
          ),
        ),
      ),
    );
  }
}
