import 'package:flutter/material.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/sizes.dart';

class AgeGridLayout extends StatelessWidget {
  AgeGridLayout({super.key});

  final List ageGrid = [
    ["Years", AppColor.mayaBlue, "0"],
    ["Months", AppColor.hotPink, "0"],
    ["Weeks", AppColor.brownYellow, "0"],
    ["Days", AppColor.pinkFlamingo, "0"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: 4,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: Sizes.md, 
          childAspectRatio: .72,
        ), 
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: Sizes.md),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.md),
              color: ageGrid[index][1],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(ageGrid[index][0],
                  style: Theme.of(context).textTheme.headlineSmall!.apply(color: AppColor.light),),
                const SizedBox(height: Sizes.xs),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Sizes.sm),
                    color: AppColor.light,
                  ),
                  constraints: const BoxConstraints(
                    maxHeight: Sizes.xxl,
                    maxWidth: Sizes.xxl,
                  ),
                  child: Center(child: Text(ageGrid[index][2], style: Theme.of(context).textTheme.headlineMedium!.apply(color: AppColor.black),))
                )
              ],
            ),
          );
              
        },
      ),
    );
  }
}