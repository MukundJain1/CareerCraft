import 'package:careercraft/constant/constant.dart';
import 'package:careercraft/src/screen/counsellor/counsellor/counsellor_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/utils.dart';

Widget counsellorDetailPagePart(
  String name,
  String fees,
  String exp,
  String field,
  String rating,
  String image,
  String about,
) {
  return Container(
    padding: EdgeInsets.all(
      5.sp,
    ),
    height: 450.h,
    // color: Colors.red,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(3.sp),
              height: 90.h,
              width: 90.w,
              decoration: BoxDecoration(
                border: Border.all(color: greyColor),
                borderRadius: BorderRadius.circular(
                  100.r,
                ),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.verified,
                      size: 18.sp,
                      color: primary2,
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    customText(
                      "$name",
                      textColor,
                      15,
                      FontWeight.w700,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.local_hospital_outlined,
                      size: 15.sp,
                      color: greyColor,
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    customText(
                      field,
                      textColor,
                      13,
                      FontWeight.w400,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),

                Row(
                  children: [
                    Icon(
                      Icons.explore,
                      size: 16.sp,
                      color: greyColor,
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    customText(
                      "Experience: $exp Years",
                      textColor,
                      12,
                      FontWeight.w700,
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 18.sp,
                      color: const Color.fromARGB(255, 255, 193, 59),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    customText(
                      "Rating: $rating",
                      textColor,
                      12,
                      FontWeight.w700,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                // customText(
                //   "Total Consultation: $rating",
                //   textColor,
                //   13,
                //   FontWeight.w500,
                // )
              ],
            ),
          ],
        ),
        SizedBox(
          height: 19.h,
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(12.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              11.r,
            ),
            color: primaryColor,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            customText(
              "About: $name",
              textColor,
              14,
              FontWeight.w500,
            ),
            Container(
              height: 250.h,
              child: SingleChildScrollView(
                child: Text(
                  about,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  // maxLines: 10,
                  // overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ]),
        ),
        SizedBox(
          height: 12.h,
        ),
        Row(
          children: [
            box("$exp year experience"),
            Spacer(),
            box("₹$fees/session"),
            Spacer(),
            box("60 mins"),
          ],
        )
      ],
    ),
  );
}

Widget expertCard(
  String mobile,
  String image,
  String name,
  String fee,
  String exp,
  String intro,
  String rate,
  String field,
  String about,
  BuildContext context,
) {
  return Container(
    height: 165.h,
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r), color: primaryColor),
    child: Row(
      children: [
        Container(
          width: 130.w,
          child: Column(children: [
            Container(
              height: 125.h,
              decoration: BoxDecoration(
                // color: Colors.yellow,
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r),
                ),
              ),
            ),
            Spacer(),
            customButton(24.h, 106.w, 12, primary2, Colors.white, "View more",
                13, FontWeight.w500, 0, 0, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CounsellorDetailPage(
                            mobile: mobile,
                            about: about,
                            exp: exp,
                            fee: fee,
                            field: field,
                            image: image,
                            name: name,
                            rate: rate,
                          )));
            }),
            Spacer(),
          ]),
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 6.w,
            vertical: 10.h,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            customText(name, Colors.black, 16, FontWeight.w700),
            customText("$exp years of experience", Colors.black87, 11.6,
                FontWeight.w400),
            SizedBox(
              height: 10.h,
            ),
            Text(
              intro,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 7,
            ),
            SizedBox(
              height: 10.h,
            ),
          ]),
        ))
      ],
    ),
  );
}

Widget counsellorDetailPart(
  String name,
  String exp,
  String field,
  String rating,
  String image,
) {
  return Container(
    padding: EdgeInsets.all(
      5.sp,
    ),
    height: 140.h,
    // color: Colors.red,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(3.sp),
              height: 90.h,
              width: 90.w,
              decoration: BoxDecoration(
                border: Border.all(color: greyColor),
                borderRadius: BorderRadius.circular(
                  100.r,
                ),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.verified,
                      size: 18.sp,
                      color: primary2,
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    customText(
                      "$name",
                      textColor,
                      15,
                      FontWeight.w700,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.local_hospital_outlined,
                      size: 15.sp,
                      color: greyColor,
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    customText(
                      field,
                      textColor,
                      13,
                      FontWeight.w400,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),

                Row(
                  children: [
                    Icon(
                      Icons.explore,
                      size: 16.sp,
                      color: greyColor,
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    customText(
                      "Experience: $exp Years",
                      textColor,
                      12,
                      FontWeight.w700,
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 18.sp,
                      color: const Color.fromARGB(255, 255, 193, 59),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    customText(
                      "Rating: $rating",
                      textColor,
                      12,
                      FontWeight.w700,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                // customText(
                //   "Total Consultation: $rating",
                //   textColor,
                //   13,
                //   FontWeight.w500,
                // )
              ],
            ),
          ],
        ),
        SizedBox(
          height: 19.h,
        ),
        SizedBox(
          height: 12.h,
        ),
      ],
    ),
  );
}

DateTime? selectedDate;
TimeOfDay? selectedTime;
Future<void> _selectDate(BuildContext context) async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2100),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: Colors.amberAccent, // <-- SEE HERE
            onPrimary: Colors.redAccent, // <-- SEE HERE
            onSurface: Colors.blueAccent, // <-- SEE HERE
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Colors.red, // button text color
            ),
          ),
        ),
        child: child!,
      );
    },
  );

  if (pickedDate != null && pickedDate != selectedDate) {
    selectedDate = pickedDate;
  }
}

Future<void> _selectTime(BuildContext context) async {
  final TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if (pickedTime != null && pickedTime != selectedTime) {
    selectedTime = pickedTime;
  }
}

Widget box(String title) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 4.sp, horizontal: 10.w),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: primaryColor, width: 2)),
    child: customText(title, textColor, 12, FontWeight.w400),
  );
}
