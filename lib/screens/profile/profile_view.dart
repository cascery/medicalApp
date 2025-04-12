import 'package:doctor_app/screens/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the ProfileController (it will be injected using ProfileBinding)
    final ProfileController profileController = Get.find<ProfileController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings,
                color: Theme.of(context).colorScheme.onPrimary),
            onPressed: () {
              // Navigate to settings page or show settings dialog
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile Picture (Reactive)
                Obx(() => CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.2,
                      backgroundImage: AssetImage(profileController.profileImage.value),
                    )),
                const SizedBox(height: 16),

                // User Info (Reactive)
                Obx(() => Text(
                      profileController.userLocation.value,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Theme.of(context).colorScheme.secondary),
                    )),
                Obx(() => Text(
                      profileController.userOccupation.value,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    )),
                const SizedBox(height: 24),

                // Edit Profile Button
                ElevatedButton(
                  onPressed: () {
                    // Handle profile editing
                    // Maybe use Get.to() to navigate to edit profile screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 48),
                  ),
                  child: Text(
                    'Edit Profile',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                ),
                const SizedBox(height: 16),

                // Log Out Button
                ElevatedButton(
                  onPressed: () {
                    // Handle log out
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryFixedDim,
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 48),
                  ),
                 child: Text(
                    'Log Out',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
