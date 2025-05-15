import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triangle/utils/constants/app_colors.dart';
import 'package:triangle/utils/constants/sizes.dart';

class VaccineStackLayout extends StatelessWidget {
  const VaccineStackLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
    
        Container(
          width: MediaQuery.of(context).size.width - Sizes.xl * 3,
          height: 156,
          decoration: BoxDecoration(
            color: AppColor.royalBlue.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(Sizes.sm),
          ),
        ),
    
        Positioned(
          bottom: 14,
          child: Container(
            width: MediaQuery.of(context).size.width - Sizes.xl * 2,
            height: 156,
            decoration: BoxDecoration(
              color: AppColor.lightSlateBlue.withValues(alpha: 0.8),
              borderRadius: BorderRadius.circular(Sizes.sm),
            ),
          ),
        ),
        
        Positioned(
          top: 0,
          child: Container(
            width: MediaQuery.of(context).size.width - Sizes.xl,
            height: 156,
            padding: EdgeInsets.all(Sizes.rlg),
            decoration: BoxDecoration(
              color: AppColor.royalBlue,
              borderRadius: BorderRadius.circular(Sizes.sm),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/svg/clarity_clock-line.svg"),
                    const SizedBox(width: Sizes.sm),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("OPV-3",
                            style: Theme.of(context).textTheme.headlineLarge!.apply(color: AppColor.light),),
                          Text("4th dose of Oral Polio Vaccine",
                            style: Theme.of(context).textTheme.titleSmall!.apply(color: AppColor.light),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: Sizes.xs + 2),
                Container(
                  padding: const EdgeInsets.all(Sizes.sm),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Sizes.sm),
                    color: AppColor.mediumSlateBlue,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/svg/calendar.svg"),
                      const SizedBox(width: Sizes.md),
                      Text("Monday, 10 March 2025",
                        style: Theme.of(context).textTheme.titleSmall!.apply(color: AppColor.light),),
                    ],
                  ),
                ),
              ],
            )
          ),
        )
      ],
    );
  }
}
