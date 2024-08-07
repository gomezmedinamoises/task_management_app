import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_app/common/utils/constants.dart';
import 'package:task_management_app/features/auth/pages/otp_page.dart';
import 'package:task_management_app/features/onboarding/pages/onboarding.dart';
import 'package:task_management_app/features/todo/pages/home_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        // this property helps to avoid keyboard overlapping in text fields
        useInheritedMediaQuery: true,
        designSize: const Size(375, 875),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Task Management',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: AppConstants.kBkDark,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            themeMode: ThemeMode.dark,
            home: const OtpPage(),
          );
        });
  }
}
