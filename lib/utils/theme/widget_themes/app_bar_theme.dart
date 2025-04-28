import 'package:flutter/material.dart';
import 'package:triangle/utils/constants/app_colors.dart';
import 'package:triangle/utils/constants/sizes.dart';

class AppbarTheme {
  static AppBarTheme lightAppBarTheme = const AppBarTheme(
    elevation: 0,
    centerTitle: true,
    foregroundColor: AppColor.black,
    backgroundColor: AppColor.softGrey,
    actionsPadding: EdgeInsets.only(right: Sizes.md),
    iconTheme: IconThemeData(color: AppColor.black),
    actionsIconTheme: IconThemeData(color: AppColor.black),
  );

  static AppBarTheme darkAppBarTheme = const AppBarTheme(
    elevation: 0,
    centerTitle: true,
    foregroundColor: AppColor.white,
    backgroundColor: AppColor.darkerGrey,
    actionsPadding: EdgeInsets.only(right: Sizes.md),
    iconTheme: IconThemeData(color: AppColor.white),
    actionsIconTheme: IconThemeData(color: AppColor.white),
  );
}
