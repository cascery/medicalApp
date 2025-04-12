import 'package:doctor_app/screens/profile/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController()); // This binds the ProfileController
  }
}
