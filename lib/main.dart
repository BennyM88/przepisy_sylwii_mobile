import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';
import 'package:przepisy_sylwii_mobile/view/pages/home_page.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/enter_exit_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'PrzepisySylwii',
          theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: CustomColors.neutral100,
            pageTransitionsTheme: PageTransitionsTheme(
              builders: {
                TargetPlatform.android: EnterExitTransitionsBuilder(),
                TargetPlatform.iOS:
                    const CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
              },
            ),
          ),
          home: HomePage(),
        );
      },
    );
  }
}
