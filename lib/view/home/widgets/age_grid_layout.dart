import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triangle/view_model/home/home_controller.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/sizes.dart';

class AgeGridLayout extends StatelessWidget {
  const AgeGridLayout({super.key});


  @override
  Widget build(BuildContext context) {

    final controller = Get.find<HomeController>();
    
    return Scaffold(
      body: GridView.builder(
        itemCount: 4,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: Sizes.rmd, 
          childAspectRatio: .72,
        ), 
        itemBuilder: (BuildContext context, int index) {
          return Obx(() =>
            Container(
              padding: EdgeInsets.symmetric(vertical: Sizes.rmd),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.md),
                color: controller.ageGrid[index][1],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(controller.ageGrid[index][0],
                    style: Theme.of(context).textTheme.headlineSmall!.apply(color: AppColor.light),),
                  SizedBox(height: Sizes.rxs),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.sm),
                      color: AppColor.light,
                    ),
                    constraints: BoxConstraints(
                      maxHeight: Sizes.rxxl,
                      maxWidth: Sizes.rxxl,
                    ),
                    child: Center(child: Text(controller.ageGrid[index][2], style: Theme.of(context).textTheme.headlineMedium!.apply(color: AppColor.black),))
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}