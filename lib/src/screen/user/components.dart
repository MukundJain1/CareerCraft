import 'package:careercraft/constant/constant.dart';
import 'package:careercraft/src/screen/pages/splash/splash.dart';
import 'package:careercraft/src/service/service.dart';
import 'package:careercraft/src/utils/utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget userContainer(String title) {
  return InkWell(
    onTap: () {
      showToast("Coming Soon");
    },
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
          // color: primaryColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: primary2)),
      child: Row(children: [
        customText(
          title,
          Colors.black87,
          17,
          FontWeight.w500,
        ),
        Spacer(),
        Icon(
          Icons.forward,
          color: greyColor,
        ),
      ]),
    ),
  );
}

Widget logoutButton(BuildContext context) {
  return InkWell(
    onTap: () {
      UserDatabaseManager().clearSavedData();
      UserDatabaseManager().signOut();
      showToast("Logout Successfully!");
      Navigator.of(context, rootNavigator: true).pushReplacement(
        MaterialPageRoute(
          builder: (context) => new Splash(),
        ),
      );
    },
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: primary2)),
      child: customText(
        "Logout",
        Colors.black87,
        17,
        FontWeight.w600,
      ),
    ),
  );
}
