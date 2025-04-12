import 'package:doctor_app/screens/doctor_details/doctor_details_view.dart';
import 'package:doctor_app/screens/explore/explore_view.dart';
import 'package:doctor_app/screens/profile/profile_view.dart';
import 'package:get/get.dart';
import '../screens/home/home_view.dart';
import '../screens/home/home_binding.dart';
// Import the Explore page
import '../screens/explore/explore_binding.dart'; // Import the Explore binding
 // Import the Profile page
import '../screens/profile/profile_binding.dart'; // Import the Profile binding
 // Import the Doctor Details page
import '../screens/doctor_details/doctor_details_binding.dart'; // Import the Doctor Details binding

class AppPages {
  static const initial = '/home';

  static final routes = [
    // Home Page
    GetPage(
      name: '/home',
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),

    // Explore Page
    GetPage(
      name: '/explore',
      page: () => const ExplorePage(),
      binding: ExploreBinding(), // Add the ExploreBinding here
    ),

    // Profile Page
    GetPage(
      name: '/profile',
      page: () => const ProfilePage(),
      binding: ProfileBinding(), // Add the ProfileBinding here
    ),

    // Doctor Details Page
    GetPage(
      name: '/doctor_details',
      page: () => DoctorDetailsScreen(doctorId: Get.arguments['doctorId']),
      binding: DoctorDetailsBinding(), // Add the DoctorDetailsBinding here
    ),
  ];
}
