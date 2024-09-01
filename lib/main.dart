import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_student_record/const/color.dart';

import 'package:getx_student_record/controller/getx_bindings.dart';
import 'package:getx_student_record/database/db_functions.dart';
import 'package:getx_student_record/screens/splash_Screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Intailization(),
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
