import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:przepisy_sylwii_mobile/constants/colors.dart';
import 'package:przepisy_sylwii_mobile/core/main_provider.dart';
import 'package:przepisy_sylwii_mobile/core/state_wrapper.dart';
import 'package:przepisy_sylwii_mobile/firebase_options.dart';
import 'package:przepisy_sylwii_mobile/injection.dart';
import 'package:przepisy_sylwii_mobile/services/config_reader/config_reader.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/enter_exit_transition.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigReader.initialize();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  configureDependencies();

  // getIt<FirebaseRepository>().signOut();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MainProvider(
          child: MaterialApp(
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
            home: const StateWrapper(),
          ),
        );
      },
    );
  }
}
