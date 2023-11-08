// import 'package:careercraft/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



PreferredSizeWidget? get appBar => AppBar(
      toolbarHeight: 65.h,
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
