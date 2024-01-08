import 'package:careercraft/constant/constant.dart';
import 'package:careercraft/src/screen/user/components.dart';
import 'package:careercraft/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
      child: Column(
        children: [
          Center(
            child: customText("Profile", Colors.black, 19, FontWeight.w600),
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            padding: EdgeInsets.all(7.sp),
            height: 160.h,
            width: 160.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(56.r),
              color: Color.fromARGB(255, 213, 212, 212),
            ),
            alignment: Alignment.bottomRight,
            child: Icon(
              Icons.camera_alt,
              size: 30.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          customText(
            "Ashish Yadav",
            Colors.black,
            26,
            FontWeight.w600,
          ),
          customText(
            "12, Footballer ",
            greyColor,
            14,
            FontWeight.w600,
          ),
          Spacer(),
          userContainer("Appointment History"),
          SizedBox(
            height: 8.h,
          ),
          userContainer("Interest Feed"),
          SizedBox(
            height: 8.h,
          ),
          userContainer("About Us"),
          SizedBox(
            height: 8.h,
          ),
          userContainer("Connect & Rate Us"),
          SizedBox(
            height: 8.h,
          ),
          userContainer("Help & Support"),
          SizedBox(
            height: 8.h,
          ),
          logoutButton(context),
          SizedBox(
            height: 8.h,
          ),
          Spacer(),
        ],
      ),
    ));
  }
}
