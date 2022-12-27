import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class RecipeDetailsPage extends StatelessWidget {
  const RecipeDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        minHeight: 0.55.sh,
        maxHeight: 0.75.sh,
        parallaxEnabled: true,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36.r),
          topRight: Radius.circular(36.r),
        ),
        body: Stack(
          children: [
            SizedBox(
              height: 0.5.sh,
              child: Image.asset(
                'assets/images/suflet.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 70.h,
              left: 20.w,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: CustomColors.neutral100,
                  size: 26.sp,
                ),
              ),
            ),
          ],
        ),
        panel: Text('Jol'),
      ),
    );
  }
}
