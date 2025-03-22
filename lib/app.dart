import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triangle/view/auth/login_view.dart';

import 'utils/theme/theme.dart';
import 'utils/translations/localization_service.dart';
import 'view/auth/register_view.dart';

class LittleSteps extends StatelessWidget {
  const LittleSteps({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Little Steps',
      debugShowCheckedModeBanner: false,
      translations: LocalizationService(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const RegisterView(),
    );
  }
}
