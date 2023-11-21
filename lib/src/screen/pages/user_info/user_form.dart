import 'package:careercraft/constant/constant.dart';
import 'package:careercraft/src/screen/pages/user_info/components/components.dart';
import 'package:careercraft/src/utils/utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserFormPage extends StatefulWidget {
  const UserFormPage({super.key});

  @override
  State<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  int ps = 0, ss = 0, hs = 0, its = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          height: 690.h,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFFFEBD9), Color(0xFFDFCCFB)],
            ),
          ),

          // heading section
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: Column(
              children: [
                SizedBox(
                  height: 10.0.h,
                ),

                // Question section

                customText(
                  "Which Section do you belong to?",
                  blackColor,
                  21,
                  FontWeight.w600,
                ),

                SizedBox(
                  height: 25.0.h,
                ),

                // options section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    schoolingCard("Primary", 'assets/icons/primary.png'),
                    
                schoolingCard("Secondary", 'assets/icons/secodary.png'),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    schoolingCard("Higher", 'assets/icons/higher.png'),
                    schoolingCard("Intermediate", 'assets/icons/inter.png'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
