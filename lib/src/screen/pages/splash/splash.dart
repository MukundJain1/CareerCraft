import 'package:careercraft/constant/constant.dart';
import 'package:careercraft/src/screen/pages/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/utils.dart';
import '../../home/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    _navigatetologin();
  }

  _navigatetologin() async {
    await Future.delayed(Duration(seconds: 5), () {});
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String number = prefs.getString("phone") ?? "+911111111111";
    bool isLogin = prefs.getBool("isLogin") ?? false;

    isLogin
        ? {
            // ignore: use_build_context_synchronously
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage(index: 0,)))
          }
        : Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // padding: EdgeInsets.all(16.sp),
                    height: 122.h,
                    width: 122.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.sp),
                      color: Colors.transparent,
                    ),
                    child: Container(
                      height: 89.h,
                      width: 89.w,
                      decoration: const BoxDecoration(
                        // color: Color(0xFF25265F),
                        image: DecorationImage(
                          image: AssetImage("assets/icons/logo.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7.64.h,
                  ),
                  customText("CareerCraft", Colors.black, 28, FontWeight.w900),
                  Text(
                    "Shape your future",
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 1.2.sp,
                      fontSize: 12.42.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/logo.png",
                  width: 40.w,
                  height: 40.h,
                ),
                SizedBox(
                  width: 10.38.w,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Developer",
                        style: TextStyle(
                            color: Color(0xFF484848),
                            fontSize: 11.54.sp,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        "Team CareerCraft",
                        style: TextStyle(
                            color: Color(0xFF484848),
                            fontSize: 12.69.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
