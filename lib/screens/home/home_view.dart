import 'package:doctor_app/shared/widgets/avatars/circle_avatar_with_text_label.dart';
import 'package:doctor_app/shared/widgets/list_tiles/doctor_list_tile.dart';
import 'package:doctor_app/shared/widgets/titles/section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome', style: textTheme.bodyMedium),
            const SizedBox(height: 4),
            Text('aya kechroud', style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.location_on, color: colorScheme.secondary),
                const SizedBox(width: 4),
                Text('souk ahras,dz', style: textTheme.bodySmall!.copyWith(color: colorScheme.secondary)),
                const SizedBox(width: 4),
                Icon(Icons.expand_more, color: colorScheme.secondary),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
          const SizedBox(width: 8),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Search for a doctor . . .',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: Container(
                  margin: const EdgeInsets.all(4),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: colorScheme.onSurfaceVariant),
                  child: const Icon(Icons.filter_alt_outlined, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return const SingleChildScrollView(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              _DoctorCategories(),
              SizedBox(height: 24.0),
              _NearbyDoctors(),
            ],
          ),
        );
      }),
    );
  }
}

class _DoctorCategories extends StatelessWidget {
  const _DoctorCategories();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: 'Categories', action: 'See all', onPressed: () {}),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: DoctorCategory.values.take(5).map(
            (category) => Expanded(
              child: CircleAvatarWithTextLabel(icon: category.icon, label: category.name),
            ),
          ).toList(),
        ),
      ],
    );
  }
}

class _NearbyDoctors extends StatelessWidget {
  const _NearbyDoctors();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        SectionTitle(title: 'Nearby Doctors', action: 'See all', onPressed: () {}),
        const SizedBox(height: 8),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (_, __) => Divider(height: 24, color: colorScheme.surfaceContainerHighest),
          itemCount: Doctor.sampleDoctors.length,
          itemBuilder: (context, index) {
            final doctor = Doctor.sampleDoctors[index];
            return DoctorListTile(doctor: doctor);
          },
        )
      ],
    );
  }
}
