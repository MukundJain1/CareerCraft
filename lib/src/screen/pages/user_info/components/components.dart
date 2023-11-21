import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant/constant.dart';
import '../../../../utils/utils.dart';

PreferredSizeWidget? get appBar => AppBar(
      toolbarHeight: 65.h,
      iconTheme: IconThemeData(color: blackColor),
      // shadowColor: Color(0x00DFCCFB)   ,
      // elevation: 2,
      // leadingWidth: 60.w,
      backgroundColor: primaryColor,
      automaticallyImplyLeading: true,
      title: Row(
        children: [
          SizedBox(width: 5.w),
          Text(
            "CareerCraft",
            style: TextStyle(
                color: Colors.black, fontSize: 28.sp, fontWeight: FontWeight.w500,),
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

Widget schoolingCard(String title, String image,int s ,Function()? onTap) {
  return InkWell(
    onTap: onTap,
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
      ], borderRadius: BorderRadius.circular(14.r), color: s==0?Colors.white:primary2),
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

Widget classCard(String title, String image,int color, Function()? onTap) {
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
          color: color==0?Colors.white:primary2),
          child: Image.asset(image),
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
