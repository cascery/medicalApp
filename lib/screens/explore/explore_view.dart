import 'package:doctor_app/screens/explore/explore_controller.dart';
import 'package:doctor_app/shared/widgets/avatars/circle_avatar_with_text_label.dart';
import 'package:doctor_app/shared/widgets/titles/section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:models/models.dart' show DoctorCategory;


class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the controller instance
    final ExploreController exploreController = Get.find<ExploreController>();

    // Use MediaQuery for responsive layout
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Search bar
            PreferredSize(
              preferredSize: const Size.fromHeight(64),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Obx(() => TextFormField(
                      onChanged: exploreController.updateSearchQuery,
                      decoration: InputDecoration(
                        hintText: 'Search for a doctor . . .',
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: Container(
                          margin: const EdgeInsets.all(4),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                          child: const Icon(
                            Icons.filter_alt_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )),
              ),
            ),

            // Categories Section
            SectionTitle(
              title: 'Categories',
              action: 'See all',
              onPressed: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: DoctorCategory.values
                  .take(5)
                  .map(
                    (category) => Expanded(
                      child: CircleAvatarWithTextLabel(
                          icon: category.icon, label: category.name),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
