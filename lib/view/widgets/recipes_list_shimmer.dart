import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/shimmer_box.dart';

class RecipesListShimmer extends StatelessWidget {
  const RecipesListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      child: Row(
        children: [
          Column(
            children: const [
              ShimmerBox(height: 280, width: 280, radius: 16),
              ShimmerBox(
                height: 85,
                width: 240,
                radius: 16,
                isStack: true,
              ),
            ],
          ),
          SizedBox(width: 40.w),
          Column(
            children: const [
              ShimmerBox(height: 280, width: 280, radius: 16),
              ShimmerBox(
                height: 85,
                width: 240,
                radius: 16,
                isStack: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
