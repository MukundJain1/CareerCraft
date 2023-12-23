import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../constant/constant.dart';

Widget mediumTextBold(
  String text,
  Color color,
) {
  return Text(
    overflow: TextOverflow.ellipsis,
    text,
    style: TextStyle(
      letterSpacing: 0.1,
      color: color,
      fontWeight: FontWeight.w700,
      fontSize: 14.sp,
    ),
  );
}

Widget mediumText(String text, Color color) {
  return Text(
    text,
    style: TextStyle(
        overflow: TextOverflow.ellipsis,
        letterSpacing: 0.1,
        color: color,
        // fontWeight: FontWeight.w600,
        fontSize: 11.6.sp,
        fontWeight: FontWeight.w400),
  );
}

Widget customText(String text, Color color, double size, FontWeight weight) {
  return Text(
    text,
    style: TextStyle(
      overflow: TextOverflow.ellipsis,
      letterSpacing: 0.1,
      color: color,
      fontWeight: weight,
      fontSize: size.sp,
    ),
  );
}

Widget customButton(
  double height,
  double width,
  double radius,
  Color color,
  Color textColor,
  String text,
  double fontSize,
  FontWeight fontWeight,
  int shadow,
  int border,
  Function()? onTap,
) {
  return InkWell(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
        border: border == 1
            ? Border.all(
                color: greyColor,
              )
            : const Border(),
        boxShadow: [
          shadow == 1
              ? const BoxShadow(
                  blurRadius: 1,
                  offset: Offset(
                    0,
                    0,
                  ),
                )
              : const BoxShadow(
                  blurRadius: 0,
                ),
        ],
        color: color,
        borderRadius: BorderRadius.circular(
          radius.sp,
        ),
      ),
      child: customText(
        text,
        textColor,
        fontSize,
        fontWeight,
      ),
    ),
  );
}

dynamic showToast(String title) =>
Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.pink,
        textColor: Colors.white,
        fontSize: 16.0
    );