import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triangle/utils/constants/app_colors.dart';
import 'package:triangle/utils/constants/sizes.dart';

import 'vaccine_list_view.dart';

class Vaccination extends StatelessWidget {
  const Vaccination({super.key});

  @override
  Widget build(BuildContext context) {
    double progressValue = 4 / 10; // Example: 4 out of 10 completed
    int percentage = (progressValue * 100).round(); // 60%

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.md, vertical: Sizes.sm),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(Sizes.lg),
              decoration: BoxDecoration(
                  color: AppColor.lightCyan,
                  borderRadius: BorderRadius.circular(Sizes.lg),
                  boxShadow: const [
                    BoxShadow(
                    color: AppColor.grey,
                    blurRadius: Sizes.xs,
                    // spreadRadius: 0,
                    offset: Offset(0, Sizes.xs),
                  ),
                  ]
                ), 
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Baby Image
                  CircleAvatar(
                    radius: Sizes.xxl,
                    child:
                        Image.asset("assets/images/default_baby_profile.png"),
                  ),
                  const SizedBox(width: Sizes.spaceBtwItems),
                  // Baby Name and Age
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Baby Sophia",
                                style: Theme.of(context).textTheme.titleMedium),
                            Text(
                              "Age: 2 months",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),

                        const SizedBox(height: Sizes.lg),
                    
                    
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("4/10",
                                  style: Theme.of(context).textTheme.bodyLarge,),
                                Text("$percentage%",
                                  style: Theme.of(context).textTheme.bodyLarge,)
                              ],
                            ),
                            LinearProgressIndicator(
                              value: progressValue,
                              backgroundColor: AppColor.light,
                              valueColor: const AlwaysStoppedAnimation<Color>(AppColor.success),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: Sizes.md),

            Row(
              children: [
                const Icon(Icons.access_time, color: AppColor.black,),

                const SizedBox(width: Sizes.xs),

                Text("Pending Vaccinations",
                  style: Theme.of(context).textTheme.headlineSmall)
              ],
            ),

            const SizedBox(height: Sizes.sm),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 280,
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: Sizes.sm),
                        child: Container(
                          padding: const EdgeInsets.all(Sizes.md),
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(Sizes.md),
                            boxShadow: const [
                              BoxShadow(color: AppColor.grey, blurRadius: 6),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(Icons.vaccines_outlined, color: AppColor.secondary, size: 40),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'OPV',
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: Sizes.xs),
                                      Text(
                                        'Dose: 3rd\nDate: 01/01/2023',
                                        style: Theme.of(context).textTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: AppColor.pigPink,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Text(
                                    'Mark as Given',
                                    style: TextStyle(
                                      color: AppColor.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  ),
                ),

                const SizedBox(height: Sizes.sm),

                Padding(
                  padding: const EdgeInsets.only(right: Sizes.md),
                  child: Container(
                    padding: const EdgeInsets.symmetric( horizontal: Sizes.sm, vertical: Sizes.xs),
                    decoration: BoxDecoration(
                      color: AppColor.secondary,
                      borderRadius: BorderRadius.circular(Sizes.sm),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('See All',
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColor.white, fontWeight: FontWeight.bold)),
                        const SizedBox(width: Sizes.xs),
                        const Icon(Icons.arrow_forward, color: AppColor.white, size: 14),
                      ],
                    ),
                  ),
                )
              ],
            ),

            
            const SizedBox(height: Sizes.md),

            // Upcoming Vaccines Section
            Row(
              children: [
                const Icon(Icons.hourglass_bottom, color: AppColor.black),
                const SizedBox(width: Sizes.xs),
                Text('Upcoming Vaccine Doses',
                  style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),

            const SizedBox(height: Sizes.md),

            // Upcoming Vaccine Table
            Table(
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(1),
              },
              border: const TableBorder(
                horizontalInside: BorderSide(color: AppColor.grey),
              ),
              children: [
                // Header
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: Sizes.sm),
                      child: Text('Vaccines',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: Sizes.sm),
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Due Age',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                  ],
                ),
                // Row 1
                TableRow(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text('Measles-Rubella (1st dose)'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: const Text('9 Months'),
                      ),
                    ),
                  ],
                ),
                // Row 2
                TableRow(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text('Measles-Rubella (2nd dose)'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: const Text('15 Months'),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: Sizes.sm),

            FilledButton.icon(
              onPressed: () { Get.to(() => const VaccineListView()); }, 
              style: FilledButton.styleFrom(backgroundColor: AppColor.secondary),
              icon: const Icon(Icons.add), 
              label: const Text("Add More"),
            )
          ],
        ),
      ),
    );
  }
}