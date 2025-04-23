import 'package:flutter/material.dart';
import 'package:triangle/utils/helpers/helper_functions.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/constants/sizes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text("Baby Shophia",
              style: Theme.of(context).textTheme.titleMedium,),
            Text("Born in October 25, 2024",
              style: Theme.of(context).textTheme.labelMedium,),
          ],
        ),
        backgroundColor: AppColor.softGrey,
        centerTitle: true,
        leading: const Icon(Icons.menu),
        actionsPadding: const EdgeInsets.only(right: Sizes.md),
        actions: const [
          CircleAvatar(
            radius: Sizes.md,
            child: Icon(Icons.person),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Sizes.md, vertical: Sizes.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppHelperFunctions.getTodaysDate(),
                      style: Theme.of(context).textTheme.labelMedium,),
                    Text("Today",
                      style: Theme.of(context).textTheme.bodyLarge,),
                  ]
                ),
                FilledButton(onPressed: () {},
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(Sizes.xl, Sizes.xl),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.sm)),
                    backgroundColor: AppColor.secondary,
                    side: const BorderSide(color: AppColor.secondary),
                  ), 
                  child: Text("Update",
                    style: Theme.of(context).textTheme.bodyLarge!.apply(color: AppColor.light),
                  ),
                ),
              ],
            ),

            const SizedBox(height: Sizes.spaceBtwItems),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: Sizes.md),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Sizes.md),
                    color: AppColor.mayaBlue,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 80,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Years",
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
                        child: Center(child: Text("0", style: Theme.of(context).textTheme.headlineMedium,))
                      )
                    ],
                  ),
                ),
                              
                Container(
                  padding: const EdgeInsets.symmetric(vertical: Sizes.md),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Sizes.md),
                    color: AppColor.hotPink,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 80,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Months",
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
                        child: Center(child: Text("0", style: Theme.of(context).textTheme.headlineMedium,))
                      )
                    ],
                  ),
                ),
                
                Container(
                  padding: const EdgeInsets.symmetric(vertical: Sizes.md),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Sizes.md),
                    color: AppColor.brownYellow,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 80,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Weeks",
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
                        child: Center(child: Text("0", style: Theme.of(context).textTheme.headlineMedium,))
                      )
                    ],
                  ),
                ),
                
                Container(
                  padding: const EdgeInsets.symmetric(vertical: Sizes.md),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Sizes.md),
                    color: AppColor.pinkFlamingo,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 80,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Days",
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
                        child: Center(child: Text("0", style: Theme.of(context).textTheme.headlineMedium,))
                      )
                    ],
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: Sizes.spaceBtwItems),

            Text("Activities",
              style: Theme.of(context).textTheme.headlineMedium),

            
          ],
        ),
      ),
    );
  }
}