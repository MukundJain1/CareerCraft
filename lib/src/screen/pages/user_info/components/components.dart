import 'package:careercraft/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/utils.dart';

PreferredSizeWidget? get appBar => AppBar(
      toolbarHeight: 45.h,
      // shadowColor: Color(0x00DFCCFB)   ,
      // elevation: 2,
      // leadingWidth: 60.w,
      backgroundColor: Colors.pink.shade400,
      automaticallyImplyLeading: true,
      title: Row(
        children: [
          SizedBox(width: 5.w),
          Text(
            "CareerCraft",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(width: 5.w),
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

Widget schoolingCard(String title, String image) {
  return InkWell(
    onTap: (){},
    child: Container(
      height: 120.h,
      width: 140.w,
      padding: EdgeInsets.all(
        12.sp,
      ),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 2.sp,
          blurStyle: BlurStyle.outer,
        )
      ], borderRadius: BorderRadius.circular(14.r), color: Colors.white),
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
