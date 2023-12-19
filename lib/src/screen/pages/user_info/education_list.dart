import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:careercraft/src/screen/pages/user_info/category.dart';
import 'package:careercraft/src/screen/pages/user_info/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constant/constant.dart';
import '../../../utils/utils.dart';

class EducationList extends StatefulWidget {
  final String education="demo";
  const EducationList({super.key, });

  @override
  State<EducationList> createState() => _ClassState();
}

class _ClassState extends State<EducationList> {
  int first = 0, second = 0, third = 0, fourth = 0;
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("EducationList"),
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
                AnimatedTextKit(
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    TyperAnimatedText(
                      'Which Standard do you belong to?',
                      textStyle: TextStyle(
                        fontSize: 21.0.sp,
                        fontWeight: FontWeight.w600,
                        color: blackColor,
                      ),
                      speed: const Duration(milliseconds: 33),
                    ),
                  ],
                ),

                SizedBox(
                  height: 25.0.h,
                ),

                // options section
                FadeInLeft(
                  animate: true,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      widget.education == "primary"
                          ? classCard("", 'assets/icons/1.png', first, () {
                              first = 1;
                              second = 0;
                              third = 0;
                              fourth = 0;
                              setState(() {});
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Category()));
                            })
                          : widget.education == "secondary"
                              ? classCard("", 'assets/icons/5.png', first, () {
                                  first = 1;
                                  second = 0;
                                  third = 0;
                                  fourth = 0;
                                  setState(() {});
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Category()));
                                })
                              : widget.education == "higher"
                                  ? classCard("", 'assets/icons/9.png', first,
                                      () {
                                      first = 1;
                                      second = 0;
                                      third = 0;
                                      fourth = 0;
                                      setState(() {});
                                      Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Category()));
                                    })
                                  : Container(),
                      widget.education == "primary"
                          ? classCard("", 'assets/icons/2.png', second, () {
                              first = 0;
                              second = 1;
                              third = 0;
                              fourth = 0;
                              setState(() {});
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Category()));
                            })
                          : widget.education == "secondary"
                              ? classCard("", 'assets/icons/6.png', second, () {
                                  first = 0;
                                  second = 1;
                                  third = 0;
                                  fourth = 0;
                                  setState(() {});
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Category()));
                                })
                              : widget.education == "higher"
                                  ? classCard("", 'assets/icons/10.png', second,
                                      () {
                                      first = 0;
                                      second = 1;
                                      third = 0;
                                      fourth = 0;
                                      setState(() {});
                                      Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Category()));
                                    })
                                  : Container(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                FadeInRight(
                  animate: true,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      widget.education == "primary"
                          ? classCard("", 'assets/icons/3.png', third, () {
                              first = 0;
                              second = 0;
                              third = 1;
                              fourth = 0;
                              setState(() {});
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Category()));
                            })
                          : widget.education == "secondary"
                              ? classCard("", 'assets/icons/7.png', third, () {
                                  first = 0;
                                  second = 0;
                                  third = 1;
                                  fourth = 0;
                                  setState(() {});
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Category()));
                                })
                              : Container(),
                      widget.education == "primary"
                          ? classCard("", 'assets/icons/4.png', fourth, () {
                              first = 0;
                              second = 0;
                              third = 0;
                              fourth = 1;
                              setState(() {});
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Category()));
                            })
                          : widget.education == "secondary"
                              ? classCard("", 'assets/icons/8.png', fourth, () {
                                  first = 0;
                                  second = 0;
                                  third = 0;
                                  fourth = 1;
                                  setState(() {});
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Category()));
                                })
                              : Container(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
