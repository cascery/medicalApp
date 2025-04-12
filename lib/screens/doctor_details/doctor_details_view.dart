// lib/screens/doctor_details/doctor_details_view.dart

import 'package:doctor_app/repositories/doctor_repository.dart';
import 'package:doctor_app/shared/utils/time_of_day_extension.dart';
import 'package:doctor_app/shared/widgets/buttons/app_icon_button.dart';
import 'package:doctor_app/shared/widgets/cards/doctor_card.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'doctor_details_controller.dart';
import 'doctor_details_binding.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final String doctorId;

  const DoctorDetailsScreen({super.key, required this.doctorId});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorDetailsController>(
      init: DoctorDetailsController(
        doctorRepository: Get.find<DoctorRepository>(), // assuming you have a doctorRepository
      )..loadDoctorDetails(doctorId),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: AppIconButton(
              icon: Icons.arrow_back,
              onTap: () => Navigator.pop(context),
            ),
            title: const Text(
              'Doctor Details',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              AppIconButton(
                icon: Icons.favorite_outline,
                onTap: () {},
              ),
            ],
          ),
          body: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            if (controller.hasError.value) {
              return const Center(child: Text('Something went wrong'));
            }
            final doctor = controller.doctor.value;
            if (doctor == null) {
              return const Center(child: Text('Doctor not found.'));
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DoctorCard(doctor: doctor),
                  const Divider(height: 32.0),
                  _DoctorWorkingHours(workingHours: doctor.workingHours),
                ],
              ),
            );
          }),
        );
      },
    );
  }
}

class _DoctorWorkingHours extends StatelessWidget {
  final List<DoctorWorkingHours> workingHours;

  const _DoctorWorkingHours({required this.workingHours});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Working Hours',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        ListView.separated(
          padding: const EdgeInsets.all(8.0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: workingHours.length,
          separatorBuilder: (context, index) => const SizedBox(height: 8.0),
          itemBuilder: (context, index) {
            return Row(
              children: [
                Expanded(
                  child: Text(workingHours[index].dayOfWeek),
                ),
                const SizedBox(width: 16.0),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(workingHours[index].startTime.toCustomString()),
                ),
                const SizedBox(width: 16.0),
                const Text("-"),
                const SizedBox(width: 16.0),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(workingHours[index].endTime.toCustomString()),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
