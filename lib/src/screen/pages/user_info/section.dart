import 'package:animate_do/animate_do.dart';
import 'package:careercraft/constant/constant.dart';
import 'package:careercraft/src/screen/pages/user_info/class.dart';
import 'package:careercraft/src/screen/pages/user_info/components/components.dart';
import 'package:careercraft/src/utils/utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserFormPage extends StatefulWidget {
  static String section = "";
  const UserFormPage({super.key});

  @override
  State<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  int ps = 0, ss = 0, hs = 0, its = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("CareerCraft"),
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

                FadeInLeft(
                  animate: true,
                  delay: Duration(milliseconds: 850),
                  child: customText(
                    "Which Section do you belong to?",
                    blackColor,
                    21,
                    FontWeight.w600,
                  ),
                ),

                SizedBox(
                  height: 25.0.h,
                ),

                // options section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FadeInLeft(
                      animate: true,
                      child: schoolingCard(
                          "Primary", 'assets/icons/primary.png', ps, () {
                        setState(() {
                          ps = 1;
                          hs = 0;
                          ss = 0;
                          its = 0;
                          UserFormPage.section = "primary";
                        });
                        
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Class(
                                      school: "primary",
                                    )));
                      }),
                    ),
                    FadeInRight(
                      animate: true,
                      child: schoolingCard(
                          "Secondary", 'assets/icons/secodary.png', ss, () {
                        ss = 1;
                        hs = 0;
                        ps = 0;
                        its = 0;
                        UserFormPage.section = "secondary";
                        setState(() {});
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Class(
                                      school: "secondary",
                                    )));
                      }),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FadeInLeft(
                      animate: true,
                      child: schoolingCard(
                          "Higher", 'assets/icons/higher.png', hs, () {
                        hs = 1;
                        ss = 0;
                        its = 0;
                        ps = 0;
                        UserFormPage.section = "higher";
                        setState(() {});
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Class(
                                      school: "higher",
                                    )));
                      }),
                    ),
                    FadeInRight(
                      animate: true,
                      child: schoolingCard(
                          "Intermediate", 'assets/icons/inter.png', its, () {
                        setState(() {
                          its = 1;
                          ps = 0;
                          ss = 0;
                          hs = 0;
                          UserFormPage.section = "intermediate";
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Class(
                                      school: "intermediate",
                                    )));
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
