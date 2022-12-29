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
              ShimmerBox(280, 280, 16),
              ShimmerBox(240, 90, 16),
            ],
          ),
          SizedBox(width: 40.w),
          Column(
            children: const [
              ShimmerBox(280, 280, 16),
              ShimmerBox(240, 90, 16),
            ],
          ),
        ],
      ),
    );
  }
}
