import 'package:get/get.dart';
import 'package:task_management_app/layouts/settings_screens/setting_screen.dart';
import 'package:task_management_app/layouts/tasks_screen_layouts/task_screen.dart';

import '../../layouts/category_screen_layouts/category_screen.dart';
import '../../layouts/home_screen_layouts/home_screen.dart';
import '../../layouts/notes_screen_layouts/notes_screen.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;

  void toggleIndex(value) {
    selectedIndex.value = value;
  }

  var listOfScreens = [
    HomeScreen(),
    NotesScreen(),
    TaskScreen(),
    CategoryScreen(),
    SettingScreen(),
  ];
}
