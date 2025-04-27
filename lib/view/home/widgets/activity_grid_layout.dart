import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triangle/utils/constants/app_colors.dart';
import 'package:triangle/utils/constants/sizes.dart';

class ActivityGridLayout extends StatelessWidget {
  ActivityGridLayout({super.key});

  final List activities = [
    ["Feeding", "assets/images/vaccine.png"],
    ["Sleeping", "assets/images/vaccine.png"],
    ["Vaccination", "assets/images/vaccine.png"],
    ["Milestone", "assets/images/vaccine.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: Sizes.md,
        mainAxisSpacing: Sizes.md,
        childAspectRatio: .9,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: Sizes.md),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.xl),
            color: Get.isDarkMode ? AppColor.surfaceDark : AppColor.floralWhite,
          ),
          child: Column(
            children: [
              Image.asset(activities[index][1]),
              const SizedBox(height: Sizes.sm),
              Text(activities[index][0],
                style: Theme.of(context).textTheme.headlineSmall),
            ],
          )
        );
      }
    );
  }
}