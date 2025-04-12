import 'package:doctor_app/app/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'repositories/doctor_repository.dart';
import 'shared/theme/app_theme.dart';
import 'shared/widgets/bottom_nav_bars/main_nav_bar.dart';
import 'state/home/_bloc.dart';
// Make sure this is imported

void main() {
  const doctorRepository = DoctorRepository();
  runApp(AppScreen(doctorRepository: doctorRepository));
}

class AppScreen extends StatelessWidget {
  const AppScreen({
    super.key,
    required this.doctorRepository,
  });

  final DoctorRepository doctorRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: doctorRepository),
        // Add other repositories if needed
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(doctorRepository: doctorRepository)
              ..add(LoadHomeEvent()),
          ),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Doctor Booking Application',
          theme: const AppTheme().themeData,
          initialRoute: AppPages.initial, // Set initial route from AppPages
          getPages: AppPages.routes, // Use the routes defined in AppPages
          home: const MainNavBar(), // This can still be used as your main page
        ),
      ),
    );
  }
}
