import 'package:doctor_app/screens/explore/explore_view.dart';
import 'package:doctor_app/screens/home_screen.dart';
import 'package:doctor_app/screens/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'navigation_controller.dart';
      // Add your actual explore screen

class MainNavBar extends StatelessWidget {
  const MainNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the controller
    final NavigationController navigationController = Get.find();

    // List of screens to display
    final List<Widget> _pages = [
      const HomeScreen(),
      const ExplorePage(),
      const Center(child: Text('Booking Page')),  // Example of Booking Page
      const ProfilePage(),
    ];

    return Scaffold(
      body: Obx(() {
        return _pages[navigationController.selectedIndex.value];
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationController.selectedIndex.value,
        onTap: (index) {
          navigationController.updateIndex(index);  // Update the selected index
        },
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
