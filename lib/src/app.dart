
import 'package:careercraft/constant/constant.dart';
import 'package:careercraft/src/screen/pages/user_info/section.dart';
import 'package:careercraft/src/screen/pages/user_info/class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:careercraft/src/screen/pages/login/login.dart';
import 'package:careercraft/src/screen/pages/login/otp.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'CareerCraft',
          theme: ThemeData(
            primaryColor: primaryColor,
            
            // primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          initialRoute: 'login',
          routes: {
            'login': (context) => LoginPage(),
            'otp' : (context) => OTP(),
            'Class' : (context) => Class(school: ""),
          },

          home: child,
        );
      },
      
      child: LoginPage(),
    );
  }
}
