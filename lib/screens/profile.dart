import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery for responsive layout
    final screenWidth = MediaQuery.of(context).size.width;

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
                // Profile Picture
                CircleAvatar(
                  radius: screenWidth * 0.2, // Make the image size responsive
                  backgroundImage: const AssetImage('assets/icons/bubbles.jpg'),
                ),
                const SizedBox(height: 16),

                // User Info
                Text(
                  'souk ahras,dz',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Theme.of(context).colorScheme.secondary),
                ),
                Text(
                  'Master\'s in AI Student',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                const SizedBox(height: 24),

                // Edit Profile Button
                ElevatedButton(
                  onPressed: () {
                    // Handle profile editing
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    minimumSize:
                        Size(screenWidth * 0.8, 48), // Responsive button width
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
                    minimumSize:
                        Size(screenWidth * 0.8, 48), // Responsive button width
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
