import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/general_bindings.dart';
import 'utils/theme/theme.dart';
import 'utils/translations/localization_service.dart';

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
      home: const Scaffold(body: Center(child: CircularProgressIndicator(),),),
    );
  }
}
