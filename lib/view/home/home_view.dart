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
              style: Theme.of(context).textTheme.bodySmall,),
          ],
        ),
        backgroundColor: AppColor.softGrey,
        centerTitle: true,
        leading: const Icon(Icons.menu),
        actionsPadding: const EdgeInsets.only(right: Sizes.sm),
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
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppHelperFunctions.getTodaysDate()),
                    Text("Today",
                      style: Theme.of(context).textTheme.bodyLarge,),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}