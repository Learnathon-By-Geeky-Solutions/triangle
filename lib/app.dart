import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triangle/view/auth/login_view.dart';

class LittleSteps extends StatelessWidget {
  const LittleSteps({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginView(),
    );
  }
}
