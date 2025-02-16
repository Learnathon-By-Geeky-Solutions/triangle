import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triangle/view/auth/login_view.dart';

import 'utils/theme/theme.dart';

class LittleSteps extends StatelessWidget {
  const LittleSteps({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Little Steps',
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const LoginView(),
    );
  }
}
