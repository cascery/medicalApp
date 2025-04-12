import 'package:get/get.dart';

class NavigationController extends GetxController {
  // Track the selected tab index
  var selectedIndex = 0.obs;

  // Method to update the selected index
  void updateIndex(int index) {
    selectedIndex.value = index;
  }
}
