import 'package:flutter/material.dart';
import 'package:triangle/utils/helpers/helper_functions.dart';
import 'package:triangle/view/home/widgets/activity_grid_layout.dart';
import 'package:triangle/view/home/widgets/age_grid_layout.dart';

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
      body: SingleChildScrollView(
        child: Padding(
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
          
              const SizedBox(height: Sizes.xs),
          
              SizedBox(height: 110, child: AgeGridLayout()),
              
              const SizedBox(height: Sizes.spaceBtwItems),
          
              Text("Activities",
                style: Theme.of(context).textTheme.headlineMedium),
          
              const SizedBox(height: Sizes.sm),
          
              const SizedBox(height: 400, child: ActivityGridLayout()),
          
              const SizedBox(height: Sizes.spaceBtwItems),
          
              Text("Upcoming Vaccines",
                style: Theme.of(context).textTheme.headlineMedium),
          
              const SizedBox(height: Sizes.sm),
          
              SizedBox(height: 140, 
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.softGrey,
                        borderRadius: BorderRadius.circular(Sizes.sm),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
