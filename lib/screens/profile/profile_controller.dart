import 'package:get/get.dart';

class ProfileController extends GetxController {
  var profileImage = 'assets/icons/bubbles.jpg'.obs;
  var userLocation = 'Souk Ahras, DZ'.obs;
  var userOccupation = 'Master\'s in AI Student'.obs;

  // Add methods to update profile data as needed
  void updateProfile(String image, String location, String occupation) {
    profileImage.value = image;
    userLocation.value = location;
    userOccupation.value = occupation;
  }
}
