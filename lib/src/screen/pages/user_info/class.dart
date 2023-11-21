import 'package:careercraft/src/screen/pages/user_info/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constant/constant.dart';
import '../../../utils/utils.dart';

class Class extends StatefulWidget {
  final String school;
  const Class({super.key, required this.school});

  @override
  State<Class> createState() => _ClassState();
}

class _ClassState extends State<Class> {
  int first = 0, second = 0, third = 0, fourth = 0;
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
                  "Which Standard do you belong to?",
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
                    widget.school == "primary"
                        ? classCard("", 'assets/icons/1.png',first, () {
                          first = 1;
                                second = 0;
                                third = 0;
                                fourth = 0;
                                setState(() {
                                  
                                });
                        })
                        : widget.school == "secondary"
                            ? classCard("", 'assets/icons/5.png', first,() {
                              first = 1;
                                second = 0;
                                third = 0;
                                fourth = 0;
                                setState(() {
                                  
                                });
                            })
                            : widget.school == "higher"
                                ? classCard("", 'assets/icons/9.png', first,() {
                                  first = 1;
                                second = 0;
                                third = 0;
                                fourth = 0;
                                setState(() {
                                  
                                });
                                })
                                : classCard("", 'assets/icons/11.png',first, () {
                                  first = 1;
                                second = 0;
                                third = 0;
                                fourth = 0;
                                setState(() {
                                  
                                });
                                }),
                    widget.school == "primary"
                        ? classCard("", 'assets/icons/2.png',second, () {
                          first = 0;
                                second = 1;
                                third = 0;
                                fourth = 0;
                                setState(() {
                                  
                                });
                        })
                        : widget.school == "secondary"
                            ? classCard("", 'assets/icons/6.png',second, () {
                               first = 0;
                                second = 1;
                                third = 0;
                                fourth = 0;
                                setState(() {
                                  
                                });
                            })
                            : widget.school == "higher"
                                ? classCard("", 'assets/icons/10.png',second, () {
                                   first = 0;
                                second = 1;
                                third = 0;
                                fourth = 0;
                                setState(() {
                                  
                                });
                                })
                                : classCard("", 'assets/icons/12.png',second, () {
                                   first = 0;
                                second = 1;
                                third = 0;
                                fourth = 0;
                                setState(() {
                                  
                                });
                                }),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    widget.school == "primary"
                        ? classCard("", 'assets/icons/3.png',third, () {
                          first = 0;
                                second = 0;
                                third = 1;
                                fourth = 0;
                                setState(() {
                                  
                                });
                        })
                        : widget.school == "secondary"
                            ? classCard("", 'assets/icons/7.png',third, () {
                              first = 0;
                                second = 0;
                                third = 1;
                                fourth = 0;
                                setState(() {
                                  
                                });
                            })
                            : Container(),
                    widget.school == "primary"
                        ? classCard("", 'assets/icons/4.png',fourth, () {
                          first = 0;
                                second = 0;
                                third = 0;
                                fourth = 1;
                                setState(() {
                                  
                                });
                        })
                        : widget.school == "secondary"
                            ? classCard("", 'assets/icons/8.png',fourth, () {
                                first = 0;
                                second = 0;
                                third = 0;
                                fourth = 1;
                                setState(() {
                                  
                                });
                              })
                            : Container(),
                  ],
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
