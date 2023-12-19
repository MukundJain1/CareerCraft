import 'package:animate_do/animate_do.dart';
import 'package:careercraft/constant/constant.dart';
import 'package:careercraft/src/screen/pages/user_info/components/components.dart';
import 'package:careercraft/src/screen/pages/user_info/education.dart';
import 'package:careercraft/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Category extends StatefulWidget {
  static String categry = "";
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  int ed = 0, sp = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Your Interest!"),
      body: Container(
        width: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFFEBD9), Color(0xFFDFCCFB)],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 8.h,
            ),
            customText(
              "What do you think?",
              blackColor,
              21,
              FontWeight.w600,
            ),
            SizedBox(
              height: 20.h,
            ),
            FadeInLeft(
                animate: true,
                child: Center(
                    child: CategoryCard(
                        "Education", "assets/icons/education.png", ed, () {
                  ed = 1;
                  sp = 0;
                  Category.categry = "education";
                  setState(() {});
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EducationPage(
                                category: "education",
                              )));
                }))),
            SizedBox(
              height: 30.h,
            ),
            FadeInRight(
                animate: true,
                child: Center(
                    child: CategoryCard("Sports", "assets/icons/sports.png", sp,
                        () {
                  sp = 1;
                  ed = 0;
                  Category.categry = "sports";
                  setState(() {});
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EducationPage(
                                category: "sports",
                              )));
                }))),
          ]),
        ),
      ),
    );
  }
}
