import 'package:doctor_app/screens/explore/explore_controller.dart';
import 'package:get/get.dart';

class ExploreBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ExploreController()); // Bind the ExploreController
  }
}
