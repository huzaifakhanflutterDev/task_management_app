import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/screens/home_navigation_screen.dart';

import '../../layouts/authentication_layouts/signup_layout.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;
  var progressValue = 0.33.obs;

  void updatePage(int index) {
    currentPage.value = index;
    if (index == 0) {
      progressValue.value = 0.33;
    } else if (index == 1) {
      progressValue.value = 0.66;
    } else if (index == 2) {
      progressValue.value = 1.0;
    }
  }

  void navigateToNextScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => FirebaseAuth.instance.currentUser == null
            ? SignupLayout()
            : HomeNavigationScreen(),
      ),
    );
  }
}
