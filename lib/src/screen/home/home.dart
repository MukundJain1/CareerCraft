import 'package:careercraft/constant/constant.dart';
import 'package:careercraft/src/screen/pages/login/login.dart';

import 'package:careercraft/src/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../service/service.dart';
import '../pages/splash/splash.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"), centerTitle: true, actions: [
        InkWell(
          child: Icon(
            Icons.logout,
            color: primaryColor,
          ),
          onTap: () {
            final FirebaseAuth auth = FirebaseAuth.instance;
                  UserDatabaseManager().clearSavedData();
                  auth.signOut();
                  Navigator.of(context, rootNavigator: true).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => new Splash(),
                    ),
                  );
          },
        ),
        SizedBox(width: 10.w,)
      ]),
      body: Center(
          child: customText("Home Page", blackColor, 44, FontWeight.w700)),
    );
  }
}
