import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/data/data_source/remote_data_source.dart';
import 'package:rakna/data/repository/parking_repository.dart';
import 'package:rakna/domain/repository/base_parking_repository.dart';
import 'package:rakna/presentation/components/notification_component.dart';
import 'package:rakna/presentation/screens/book_screen_OLD.dart';
import 'package:rakna/presentation/screens/dashboard_OLD.dart';
import 'package:rakna/presentation/screens/google_map.dart';
import 'package:rakna/presentation/screens/home_screen.dart';
import 'package:rakna/presentation/screens/map2.dart';
import 'package:rakna/presentation/screens/new_park_detail.dart';
import 'package:rakna/presentation/screens/old1H.dart';
import 'package:rakna/presentation/screens/navigation_bar.dart';
import 'package:rakna/presentation/screens/onboarding_screen.dart';
import 'package:rakna/presentation/screens/parking_detail.dart';
import 'package:rakna/presentation/screens/parking_selection.dart';
import 'package:rakna/presentation/screens/parking_timer.dart';
import 'package:rakna/presentation/screens/setting_screen.dart';
import 'package:rakna/presentation/screens/sign_in_screen.dart';
import 'package:rakna/presentation/screens/sign_up_screen.dart';
import 'package:rakna/presentation/screens/slot_selection.dart';
import 'package:rakna/presentation/screens/splash_screen.dart';
import 'package:rakna/presentation/screens/start_screen.dart';
import 'package:rakna/presentation/screens/summary_screen.dart';
import 'package:rakna/presentation/screens/payment_method.dart';
import 'package:rakna/presentation/screens/add_payment.dart';
import 'package:rakna/presentation/screens/reservation_parking_place.dart';
import 'core/services/services_locator.dart';
import 'core/utility/navigator_key.dart';
import 'domain/usecase/get_parking_usecase.dart';
import 'garage_owner/finance.dart';
import 'garage_owner/garage_owner_home_screen.dart';
import 'garage_owner/navigation_bar_garage_owner.dart';
import 'garage_owner/sign_in_garage_owner.dart';

import 'package:flutter/services.dart';




void main() async {
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();




  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            theme: ThemeData(
              // useMaterial3: true,
              primarySwatch: Colors.blue,
              primaryColorLight: Colors.blue,
              fontFamily: 'Poppins',
              textTheme: TextTheme(
                titleLarge: TextStyle(
                  fontSize: 17.5.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                bodyLarge: TextStyle(
                  fontSize: 17.5.sp,
                  fontWeight: FontWeight.w500,
                ),
                bodyMedium: TextStyle(
                  fontSize: 13.5.sp,
                  fontWeight: FontWeight.w500,
                ),
                displayMedium: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        });
  }
}
// const a = Color(0xff212C42);
// const b = Color(0xff9CA2FF);
// const c = Color(0xffEDEFFE);
// const d = Color(0xffF1F2F7);