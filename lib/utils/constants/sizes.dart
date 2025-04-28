
import 'package:flutter/material.dart';

class Sizes {
  static late double width;
  static late double height;

  static void init(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }

  static double w(double percent) {
    return width * (percent / 100);
  }

  static double h(double percent) {
    return height * (percent / 100);
  }


  // Padding and margin sizes
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;

  // Responsive sizes for different screen sizes
  static double get rxs => w(1); // 4.0
  static double get rsm => w(2); // 8.0
  static double get rmd => w(4); // 16.0
  static double get rlg => w(6); // 24.0
  static double get rxl => w(8); // 32.0
  static double get rxxl => w(12); // 48.0

  // Icon sizes
  static const double iconXs = 12.0;
  static const double iconSm = 16.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;

  //Responsive icon sizes
  static double get rIconSizeXs => w(3); // 12.0
  static double get rIconSizeSm => w(4); // 16.0
  static double get rIconSizeMd => w(6); // 24.0
  static double get rIconSizeLg => w(8); // 32.0

  // Font sizes
  static const double fs10 = 10.0;
  static const double fs12 = 12.0;
  static const double fs14 = 14.0;
  static const double fs16 = 16.0;
  static const double fs18 = 18.0;
  static const double fs20 = 20.0;
  static const double fs24 = 24.0;
  static const double fs32 = 32.0;

  // Responsive font sizes
  static double get rfs10 => w(2.5); // 10.0
  static double get rfs12 => w(3); // 12.0
  static double get rfs14 => w(3.5); // 14.0
  static double get rfs16 => w(4); // 16.0
  static double get rfs18 => w(4.5); // 18.0
  static double get rfs20 => w(5); // 20.0
  static double get rfs24 => w(6); // 24.0
  static double get rfs32 => w(8); // 32.0

  // Button sizes
  static const double buttonHeight = 48.0;
  static const double buttonWidth = 144.0;
  static const double buttonRadius = 16.0;
  static const double buttonElevation = 4.0;

  // AppBar height
  static const double appBarHeight = 56.0;

  // Image sizes
  static const double imageThumbSize = 80.0;

  // Default spacing between sections
  static const double defaultSpace = 24.0;
  static const double spaceBtwItems = 16.0;
  static const double spaceBtwSections = 32.0;

  // Border radius
  static const double borderRadiusSm = 4.0;
  static const double borderRadiusMd = 8.0;
  static const double borderRadiusLg = 12.0;

  // Divider height
  static const double dividerHeight = 1.0;

  // Product item dimensions
  static const double productImageSize = 120.0;
  static const double productImageRadius = 16.0;
  static const double productItemHeight = 160.0;

  // Input field
  static const double inputFieldRadius = 8.0;
  static const double spaceBtwInputFields = 16.0;

  // Card sizes
  static const double cardRadiusLg = 16.0;
  static const double cardRadiusMd = 12.0;
  static const double cardRadiusSm = 10.0;
  static const double cardRadiusXs = 6.0;
  static const double cardElevation = 2.0;

  // Image carousel height
  static const double imageCarouselHeight = 200.0;

  // Loading indicator size
  static const double loadingIndicatorSize = 36.0;

  // Grid view spacing
  static const double gridViewSpacing = 16.0;
}



