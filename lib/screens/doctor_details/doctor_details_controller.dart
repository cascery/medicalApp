import 'package:doctor_app/repositories/doctor_repository.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';

class DoctorDetailsController extends GetxController {
  final DoctorRepository doctorRepository;

  var doctor = Rx<Doctor?>(null);
  var isLoading = true.obs;
  var hasError = false.obs;

  DoctorDetailsController({required this.doctorRepository});

  @override
  void onInit() {
    super.onInit();
    // Now, the doctorId should be passed when initializing the controller
  }

  void loadDoctorDetails(String doctorId) async {
    try {
      isLoading(true);
      doctor.value = await doctorRepository
          .fetchDoctorById(doctorId); // Use fetchDoctorById
      hasError(false);
    } catch (e) {
      hasError(true);
      print("Error fetching doctor details: $e");
    } finally {
      isLoading(false);
    }
  }
}
