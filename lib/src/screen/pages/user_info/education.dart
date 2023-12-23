import 'package:animate_do/animate_do.dart';
import 'package:careercraft/constant/constant.dart';
import 'package:careercraft/src/screen/home/home.dart';
import 'package:careercraft/src/screen/pages/login/login.dart';
import 'package:careercraft/src/screen/pages/user_info/category.dart';
import 'package:careercraft/src/screen/pages/user_info/class.dart';
import 'package:careercraft/src/screen/pages/user_info/components/components.dart';
import 'package:careercraft/src/screen/pages/user_info/education_list.dart';
import 'package:careercraft/src/screen/pages/user_info/section.dart';
import 'package:careercraft/src/service/service.dart';
import 'package:careercraft/src/utils/utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EducationPage extends StatefulWidget {
  final String category;
  static String interest = "";
  const EducationPage({super.key, required this.category});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  int one = 0,
      two = 0,
      three = 0,
      four = 0,
      five = 0,
      six = 0,
      seven = 0,
      eight = 0,
      nine = 0,
      ten = 0,
      button = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.category == "education"
          ? appBar("Education")
          : appBar("Sports"),
      body: Container(
        // height: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFFEBD9), Color(0xFFDFCCFB)],
          ),
        ),

        // heading section
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25.0.h,
                      ),
                      FadeInDown(
                        delay: Duration(milliseconds: 0),
                        duration: Duration(milliseconds: 800),
                        animate: true,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            widget.category == "education"
                                ? educationCard("Computer Science",
                                    'assets/icons/data.png', one, 2000, () {
                                    EducationPage.interest = "computer science";
                                    setState(() {
                                      one = 1;
                                      two = 0;
                                      three = 0;
                                      four = 0;
                                      five = 0;
                                      six = 0;
                                      seven = 0;
                                      eight = 0;
                                      nine = 0;
                                      ten = 0;
                                      button = 1;
                                    });
                                    // UserDatabaseManager().submitInterest(
                                    //     LoginPage.mobile,
                                    //     UserFormPage.section,
                                    //     Class.clas,
                                    //     Category.categry,
                                    //     EducationPage.interest,
                                    //     context);
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => HomePage()));
                                  })
                                : educationCard(
                                    "Soccer",
                                    'assets/icons/soccer-ball.png',
                                    one,
                                    2000, () {
                                    EducationPage.interest = "soccer";
                                    setState(() {
                                      one = 1;
                                      two = 0;
                                      three = 0;
                                      four = 0;
                                      five = 0;
                                      six = 0;
                                      seven = 0;
                                      eight = 0;
                                      nine = 0;
                                      ten = 0;
                                      button = 1;
                                    });
                                    
                                  }),
                            widget.category == "education"
                                ? educationCard(
                                    "Physics",
                                    'assets/icons/relativity.png',
                                    two,
                                    2000, () {
                                    EducationPage.interest = "physics";
                                    one = 0;
                                    two = 1;
                                    three = 0;
                                    four = 0;
                                    five = 0;
                                    six = 0;
                                    seven = 0;
                                    eight = 0;
                                    nine = 0;
                                    ten = 0;
                                    button = 1;
                                    setState(() {});
                                    
                                  })
                                : educationCard(
                                    "Volleyball",
                                    'assets/icons/volleyball.png',
                                    two,
                                    2000, () {
                                    EducationPage.interest = "volleyball";
                                    setState(() {
                                      one = 0;
                                      two = 1;
                                      three = 0;
                                      four = 0;
                                      five = 0;
                                      six = 0;
                                      seven = 0;
                                      eight = 0;
                                      nine = 0;
                                      ten = 0;
                                      button = 1;
                                    });
                                    
                                  }),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      FadeInDown(
                        delay: Duration(milliseconds: 0),
                        duration: Duration(milliseconds: 900),
                        animate: true,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            widget.category == "education"
                                ? educationCard("Mathematics",
                                    'assets/icons/math.png', three, 2000, () {
                                    EducationPage.interest = "mathematics";
                                    setState(() {
                                      one = 0;
                                      two = 0;
                                      three = 1;
                                      four = 0;
                                      five = 0;
                                      six = 0;
                                      seven = 0;
                                      eight = 0;
                                      nine = 0;
                                      ten = 0;
                                      button = 1;
                                    });
                                    
                                  })
                                : educationCard(
                                    "Basketball",
                                    'assets/icons/basketball.png',
                                    three,
                                    2000, () {
                                    EducationPage.interest = "basketball";
                                    setState(() {
                                      one = 0;
                                      two = 0;
                                      three = 1;
                                      four = 0;
                                      five = 0;
                                      six = 0;
                                      seven = 0;
                                      eight = 0;
                                      nine = 0;
                                      ten = 0;
                                      button = 1;
                                    });
                                    
                                  }),
                            widget.category == "education"
                                ? educationCard("Biology",
                                    'assets/icons/book.png', four, 2000, () {
                                    EducationPage.interest = "education";
                                    one = 0;
                                    two = 0;
                                    three = 0;
                                    four = 1;
                                    five = 0;
                                    six = 0;
                                    seven = 0;
                                    eight = 0;
                                    nine = 0;
                                    ten = 0;
                                    button = 1;
                                    setState(() {});
                                    
                                  })
                                : educationCard("Cricket",
                                    'assets/icons/cricket.png', four, 2000, () {
                                    EducationPage.interest = "cricket";
                                    one = 0;
                                    two = 0;
                                    three = 0;
                                    four = 1;
                                    five = 0;
                                    six = 0;
                                    seven = 0;
                                    eight = 0;
                                    nine = 0;
                                    ten = 0;
                                    button = 1;
                                    setState(() {});
                                    
                                  }),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      // options section
                      FadeInDown(
                        delay: Duration(milliseconds: 0),
                        duration: Duration(milliseconds: 1000),
                        animate: true,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            widget.category == "education"
                                ? educationCard("Medicine",
                                    'assets/icons/syringe.png', five, 2000, () {
                                    EducationPage.interest = "medicine";
                                    setState(() {
                                      one = 0;
                                      two = 0;
                                      three = 0;
                                      four = 0;
                                      five = 1;
                                      six = 0;
                                      seven = 0;
                                      eight = 0;
                                      nine = 0;
                                      ten = 0;
                                      button = 1;
                                    });
                                    
                                  })
                                : educationCard("Tennis",
                                    'assets/icons/tennis.png', five, 2000, () {
                                    EducationPage.interest = "tennis";
                                    setState(() {
                                      one = 0;
                                      two = 0;
                                      three = 0;
                                      four = 0;
                                      five = 1;
                                      six = 0;
                                      seven = 0;
                                      eight = 0;
                                      nine = 0;
                                      ten = 0;
                                      button = 1;
                                    });
                                    
                                  }),
                            widget.category == "education"
                                ? educationCard("Health Sciences",
                                    'assets/icons/science.png', six, 2000, () {
                                    EducationPage.interest = "health sciences";
                                    one = 0;
                                    two = 0;
                                    three = 0;
                                    four = 0;
                                    five = 0;
                                    six = 1;
                                    seven = 0;
                                    eight = 0;
                                    nine = 0;
                                    ten = 0;
                                    button = 1;
                                    setState(() {});
                                    
                                  })
                                : educationCard("Swimming",
                                    'assets/icons/swimmer.png', six, 2000, () {
                                    EducationPage.interest = "swimming";
                                    setState(() {
                                      one = 0;
                                      two = 0;
                                      three = 0;
                                      four = 0;
                                      five = 0;
                                      six = 1;
                                      seven = 0;
                                      eight = 0;
                                      nine = 0;
                                      ten = 0;
                                      button = 1;
                                    });
                                    
                                  }),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      FadeInDown(
                        duration: Duration(milliseconds: 1500),
                        animate: true,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            widget.category == "education"
                                ? educationCard(
                                    "Finance & Business",
                                    'assets/icons/investment.png',
                                    seven,
                                    2500, () {
                                    EducationPage.interest =
                                        "Finance and Business";
                                    one = 0;
                                    two = 0;
                                    three = 0;
                                    four = 0;
                                    five = 0;
                                    six = 0;
                                    seven = 1;
                                    eight = 0;
                                    nine = 0;
                                    ten = 0;
                                    button = 1;
                                    setState(() {});
                                    
                                  })
                                : educationCard(
                                    "Gymnastics",
                                    'assets/icons/gymnastics.png',
                                    seven,
                                    2000, () {
                                    EducationPage.interest = "gymnastics";
                                    setState(() {
                                      one = 0;
                                      two = 0;
                                      three = 0;
                                      four = 0;
                                      five = 0;
                                      six = 0;
                                      seven = 1;
                                      eight = 0;
                                      nine = 0;
                                      ten = 0;
                                      button = 1;
                                    });
                                    
                                  }),
                            widget.category == "education"
                                ? educationCard(
                                    "Social Science",
                                    'assets/icons/together.png',
                                    eight,
                                    2500, () {
                                    EducationPage.interest = "social science";
                                    setState(() {
                                      one = 0;
                                      two = 0;
                                      three = 0;
                                      four = 0;
                                      five = 0;
                                      six = 0;
                                      seven = 0;
                                      eight = 1;
                                      nine = 0;
                                      ten = 0;
                                      button = 1;
                                    });
                                    
                                  })
                                : educationCard("Hiking",
                                    'assets/icons/hiking.png', eight, 2000, () {
                                    setState(() {
                                      EducationPage.interest = "Hiking";
                                      one = 0;
                                      two = 0;
                                      three = 0;
                                      four = 0;
                                      five = 0;
                                      six = 0;
                                      seven = 0;
                                      eight = 1;
                                      nine = 0;
                                      ten = 0;
                                      button = 1;
                                    });
                                    
                                  })
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      FadeInDown(
                        duration: Duration(milliseconds: 2000),
                        animate: true,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            widget.category == "education"
                                ? educationCard("Art & Design",
                                    'assets/icons/art.png', nine, 3000, () {
                                    EducationPage.interest = "education";
                                    one = 0;
                                    two = 0;
                                    three = 0;
                                    four = 0;
                                    five = 0;
                                    six = 0;
                                    seven = 0;
                                    eight = 0;
                                    nine = 1;
                                    ten = 0;
                                    button = 1;
                                    setState(() {});
                                    
                                  })
                                : educationCard(
                                    "Boxing",
                                    'assets/icons/boxing-gloves.png',
                                    nine,
                                    2000, () {
                                    EducationPage.interest = "boxing";
                                    setState(() {
                                      one = 0;
                                      two = 0;
                                      three = 0;
                                      four = 0;
                                      five = 0;
                                      six = 0;
                                      seven = 0;
                                      eight = 0;
                                      nine = 1;
                                      ten = 0;
                                      button = 1;
                                    });
                                    
                                  }),
                            widget.category == "education"
                                ? educationCard("Teaching",
                                    'assets/icons/seminar.png', ten, 3000, () {
                                    EducationPage.interest = "teaching";
                                    setState(() {
                                      one = 0;
                                      two = 0;
                                      three = 0;
                                      four = 0;
                                      five = 0;
                                      six = 0;
                                      seven = 0;
                                      eight = 0;
                                      nine = 0;
                                      ten = 1;
                                      button = 1;
                                    });
                                    
                                  })
                                : educationCard(
                                    "Badminton",
                                    'assets/icons/badminton.png',
                                    ten,
                                    2000, () {
                                    EducationPage.interest = "badminton";
                                    setState(() {
                                      one = 0;
                                      two = 0;
                                      three = 0;
                                      four = 0;
                                      five = 0;
                                      six = 0;
                                      seven = 0;
                                      eight = 0;
                                      nine = 0;
                                      ten = 1;
                                      button = 1;
                                    });
                                    
                                  })
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 45.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // SizedBox(height: 15.h,),
            button == 1
                ? Padding(
                    padding:
                        const EdgeInsets.only(bottom: 14, left: 18, right: 18),
                    child: customButton(
                        44,
                        double.infinity,
                        15,
                        primary2,
                        Colors.black,
                        "Save",
                        20,
                        FontWeight.w700,
                        0,
                        0, () {
                      UserDatabaseManager().submitInterest(
                          LoginPage.mobile,
                          UserFormPage.section,
                          Class.clas,
                          Category.categry,
                          EducationPage.interest,
                          context);
                      UserDatabaseManager().setLoginTrue();
                      UserDatabaseManager().setPhoneNumber(LoginPage.mobile);
                       Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                         const HomePage()),
                                                  (Route<dynamic> route) =>
                                                      false);
                    }),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
