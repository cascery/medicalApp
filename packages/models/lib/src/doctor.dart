import 'package:equatable/equatable.dart';

import 'doctor_address.dart';
import 'doctor_category.dart';
import 'doctor_package.dart';
import 'doctor_working_hours.dart';

class Doctor extends Equatable {
  final String id;
  final String name;
  final String bio;
  final String profileImageUrl;
  final DoctorCategory category;
  final DoctorAddress address;
  final List<DoctorPackage> packages;
  final List<DoctorWorkingHours> workingHours;
  final double rating;
  final int reviewCount;
  final int patientCount;

  const Doctor({
    required this.id,
    required this.name,
    required this.bio,
    required this.profileImageUrl,
    required this.workingHours,
    required this.category,
    required this.address,
    required this.packages,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.patientCount = 0,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        bio,
        profileImageUrl,
        workingHours,
        category,
        address,
        packages,
        rating,
        reviewCount,
        patientCount,
      ];

  static final sampleDoctors = [
    Doctor(
      id: '1',
      name: 'Dr. hasna hzam',
      bio: 'diology ',
      profileImageUrl: 'assets/icons/bubbles.jpg',
      category: DoctorCategory.familyMedicine,
      address: DoctorAddress.sampleAddresses[0],
      packages: DoctorPackage.samplePackages,
      workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
      rating: 4.5,
      reviewCount: 100,
      patientCount: 1000,
    ),
    Doctor(
      id: '2',
      name: 'Dr. nour',
      bio: '',
      profileImageUrl: 'assets/icons/bubbles.jpg',
      category: DoctorCategory.dentist,
      address: DoctorAddress.sampleAddresses[0],
      packages: DoctorPackage.samplePackages,
      workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
      rating: 3.5,
      reviewCount: 100,
      patientCount: 1000,
    ),
    Doctor(
      id: '3',
      name: 'Dr. amani',
      bio: 'filiated with several local clinics. He  his medical degree from ',
      profileImageUrl: 'assets/icons/bubbles.jpg',
      category: DoctorCategory.dermatology,
      address: DoctorAddress.sampleAddresses[0],
      packages: DoctorPackage.samplePackages,
      workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
      rating: 2.5,
      reviewCount: 100,
      patientCount: 1000,
    ),
    Doctor(
      id: '4',
      name: 'Dr. hannah',
      bio: 'Dr.  She earned her medical  ',
      profileImageUrl: 'assets/icons/bubbles.jpg',
      category: DoctorCategory.emergencyMedicine,
      address: DoctorAddress.sampleAddresses[0],
      packages: DoctorPackage.samplePackages,
      workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
      rating: 4,
      reviewCount: 100,
      patientCount: 1000,
    ),
    Doctor(
      id: '5',
      name: 'Dr. amira',
      bio:
          ' Dr. U his dental degree from the University of Dental Sciences and has . ',
      profileImageUrl: 'assets/icons/bubbles.jpg',
      category: DoctorCategory.dentist,
      address: DoctorAddress.sampleAddresses[0],
      packages: DoctorPackage.samplePackages,
      workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
      rating: 4.5,
      reviewCount: 100,
      patientCount: 1000,
    ),
    Doctor(
      id: '6',
      name: 'Dr. chaima',
      bio: 'Dr. is an anesthesiologist',
      profileImageUrl: 'assets/icons/bubbles.jpg',
      category: DoctorCategory.anesthesiology,
      address: DoctorAddress.sampleAddresses[0],
      packages: DoctorPackage.samplePackages,
      workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
      rating: 4.5,
      reviewCount: 100,
      patientCount: 1000,
    ),
  ];
}
