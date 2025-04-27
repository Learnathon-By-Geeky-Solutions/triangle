import 'package:flutter/material.dart';
import 'package:triangle/utils/helpers/helper_functions.dart';
import 'package:triangle/view/home/widgets/activity_grid_layout.dart';
import 'package:triangle/view/home/widgets/age_grid_layout.dart';
import 'package:triangle/view/home/widgets/vaccine_stack_layout.dart';

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
        leading: const Icon(Icons.menu),
        actions: const [
          CircleAvatar(
            radius: Sizes.md,
            child: Icon(Icons.person),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColor.darkGrey,
            ),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_rounded),
              label: "Activities",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.support_rounded),
              label: "Support",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: "Profile",
            ),
          ],
          currentIndex: 0,
          selectedFontSize: Sizes.fontSizeXs,
          unselectedFontSize: Sizes.fontSizeXs,
        ),
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
          
              SizedBox(height: 400, child: ActivityGridLayout()),
          
              const SizedBox(height: Sizes.spaceBtwItems),
          
              Text("Upcoming Vaccines",
                style: Theme.of(context).textTheme.headlineMedium),
          
              const SizedBox(height: Sizes.md),
          
              SizedBox(
                width: MediaQuery.of(context).size.width - Sizes.xl,
                height: 185, 
                child: const VaccineStackLayout(),
              ),
          
              const SizedBox(height: Sizes.sm),
            ],
          ),
        ),
      ),
    );
  }
}
