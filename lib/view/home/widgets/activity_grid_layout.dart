import 'package:flutter/material.dart';
import 'package:triangle/utils/constants/app_colors.dart';
import 'package:triangle/utils/constants/sizes.dart';

class ActivityGridLayout extends StatelessWidget {
  const ActivityGridLayout({
    super.key,
  });

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
            color: AppColor.floralWhite,
          ),
          child: Column(
            children: [
              Image.asset("assets/images/vaccine.png"),
              const SizedBox(height: Sizes.sm),
              Text("Vaccination",
                style: Theme.of(context).textTheme.headlineSmall),
            ],
          )
        );
      }
    );
  }
}