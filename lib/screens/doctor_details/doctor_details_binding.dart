// lib/screens/doctor_details/doctor_details_binding.dart

import 'package:doctor_app/repositories/doctor_repository.dart';
import 'package:get/get.dart';
import 'doctor_details_controller.dart';

class DoctorDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DoctorDetailsController(
      doctorRepository: Get.find<DoctorRepository>(), // Make sure DoctorRepository is registered
    ));
  }
}
