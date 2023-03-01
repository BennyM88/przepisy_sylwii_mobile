import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/shimmer_box.dart';

class SearchListShimmer extends StatelessWidget {
  const SearchListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: 8.h),
          const ShimmerBox(height: 200, width: double.infinity, radius: 16),
          SizedBox(height: 70.h),
          const ShimmerBox(height: 200, width: double.infinity, radius: 16),
        ],
      ),
    );
  }
}
