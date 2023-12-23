import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant/constant.dart';
import '../../../../utils/utils.dart';

PreferredSizeWidget? appBar(String title) {
  return AppBar(
    iconTheme: IconThemeData(color: blackColor),
    toolbarHeight: 45.h,
    // shadowColor: Color(0x00DFCCFB)   ,
    // elevation: 2,
    // leadingWidth: 60.w,
    backgroundColor: primaryColor,
    automaticallyImplyLeading: true,
    title: Row(
      children: [
        // SizedBox(width: 5.w),
        Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500),
        ),
        // SizedBox(width: 5.w),
        // Icon(Icons.arrow_drop_down_outlined),
      ],
    ),

    // actions: [
    //   Padding(
    //     padding: const EdgeInsets.only(right: 22),
    //     child: Icon(Icons.search, color: white),
    //   ),
    // ],
  );
}

Widget schoolingCard(String title, String image, int s, Function()? onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 120.h,
      width: 140.w,
      padding: EdgeInsets.all(
        12.sp,
      ),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.sp,
              blurStyle: BlurStyle.outer,
            )
          ],
          borderRadius: BorderRadius.circular(14.r),
          color: s == 0 ? Colors.white : primary2),
      child: Column(
        children: [
          SizedBox(
            height: 60.h,
            width: 60.h,
            child: Image.asset(image),
          ),
          Spacer(),
          customText(title, Colors.black, 18, FontWeight.w800)
        ],
      ),
    ),
  );
}

Widget educationCard(String title, String image, int s,int sec, Function()? onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 140.h,
      width: 150.w,
      padding: EdgeInsets.all(
        12.sp,
      ),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.sp,
              blurStyle: BlurStyle.outer,
            )
          ],
          borderRadius: BorderRadius.circular(14.r),
          color: s == 0 ? Colors.white : primary2),
      child: Column(
        children: [
          SizedBox(
              height: 80.h,
              width: 90.w,
              child:
          FlipInY(
            duration: Duration(milliseconds: sec+1000),
            animate: true,
            child:  Image.asset(image),
            ),
          ),
          Spacer(),
          Center(child: customText(title, Colors.black, 14, FontWeight.w800))
        ],
      ),
    ),
  );
}

Widget CategoryCard(String title, String image, int s, Function()? onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 180.h,
      width: 200.w,
      padding: EdgeInsets.all(
        12.sp,
      ),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.sp,
              blurStyle: BlurStyle.outer,
            )
          ],
          borderRadius: BorderRadius.circular(14.r),
          color: s == 0 ? Colors.white : primary2),
      child: Column(
        children: [
          ElasticInUp(
            duration: const Duration(seconds: 2),
            delay: const Duration(milliseconds: 300),
            animate: true,
            child: SizedBox(
              height: 120.h,
              width: 130.w,
              child: Image.asset(image),
            ),
          ),
          Spacer(),
          customText(title, Colors.black, 21, FontWeight.w800)
        ],
      ),
    ),
  );
}

Widget classCard(String title, String image, int color, Function()? onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 120.h,
      width: 140.w,
      padding: EdgeInsets.all(
        19.sp,
      ),
      decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage(image),
          //   fit: BoxFit.contain,
          // ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.sp,
              blurStyle: BlurStyle.outer,
            )
          ],
          borderRadius: BorderRadius.circular(14.r),
          color: color == 0 ? Colors.white : primary2),
      child: Swing(
        delay: Duration(milliseconds: 700),
        animate: true,
        child: Image.asset(image)),
      // child: Column(
      //   children: [
      //     SizedBox(
      //       height: 60.h,
      //       width: 60.h,
      //       child: Image.asset(image),
      //     ),
      //     Spacer(),
      //     customText(title, Colors.black, 18, FontWeight.w800)
      //   ],
      // ),
    ),
  );
}
