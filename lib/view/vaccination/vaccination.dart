import 'package:flutter/material.dart';
import 'package:triangle/utils/constants/app_colors.dart';
import 'package:triangle/utils/constants/sizes.dart';

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
                
              ],
            ),

            
            const SizedBox(height: 16),

            // Upcoming Vaccines Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.hourglass_bottom, color: AppColor.black),
                    SizedBox(width: 8),
                    Text(
                      'Upcoming Vaccine Doses',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: AppColor.secondary, // solid blue background like in your image
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'See All',
                        style: TextStyle(
                          color: AppColor.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColor.white,
                        size: 14,
                      ),
                    ],
                  ),
                ),

              ],
            ),

            const SizedBox(height: 16),

            // Upcoming Vaccine Table
            Container(
              child: Table(
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
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'Vaccines',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: const Text(
                            'Due Age',
                            style: TextStyle(fontWeight: FontWeight.bold),
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
            ),
          ],
        ),
      ),
    );
  }
}