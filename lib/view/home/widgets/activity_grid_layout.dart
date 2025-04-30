import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triangle/utils/constants/app_colors.dart';
import 'package:triangle/utils/constants/sizes.dart';
import 'package:triangle/view/vaccination/vaccination.dart';

class ActivityGridLayout extends StatelessWidget {
  ActivityGridLayout({super.key});

  final List activities = [
    ["Feeding", "assets/images/baby_feeding.png"],
    ["Sleeping", "assets/images/baby_sleep.png"],
    ["Vaccination", "assets/images/vaccine.png"],
    ["Milestone", "assets/images/milestone.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: Sizes.rmd,
        mainAxisSpacing: Sizes.rmd,
        childAspectRatio: .88,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Get.to(() => const Vaccination());
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: Sizes.rmd),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.xl),
              color: Get.isDarkMode ? AppColor.surfaceDark : AppColor.floralWhite,
            ),
            child: Column(
              children: [
                Image.asset(activities[index][1]),
                SizedBox(height: Sizes.rsm),
                Text(activities[index][0],
                  style: Theme.of(context).textTheme.headlineSmall),
              ],
            )
          ),
        );
      }
    );
  }
}