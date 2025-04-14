import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triangle/utils/constants/app_colors.dart';
import 'package:triangle/view/auth/login_view.dart';

import 'bindings/general_bindings.dart';
import 'utils/theme/theme.dart';
import 'utils/translations/localization_service.dart';
import 'view/auth/register_view.dart';

class LittleSteps extends StatelessWidget {
  const LittleSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Little Steps',
      debugShowCheckedModeBanner: false,
      translations: LocalizationService(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      initialBinding: GeneralBindings(),
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      // home: const RegisterView(),
      home: const Scaffold(body: Center(child: CircularProgressIndicator(),),),
    );
  }
}
