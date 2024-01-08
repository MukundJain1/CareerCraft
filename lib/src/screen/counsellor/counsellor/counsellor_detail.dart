import 'package:careercraft/constant/constant.dart';
import 'package:careercraft/src/screen/counsellor/components/component.dart';
import 'package:careercraft/src/screen/counsellor/schedule/schedule.dart';
import 'package:careercraft/src/service/service.dart';
import 'package:careercraft/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CounsellorDetailPage extends StatefulWidget {
  final String mobile,name, fee, exp, field, rate, image, about;
  const CounsellorDetailPage({super.key,required this.mobile,required this.name, required this.fee, required this.exp, required this.field, required this.rate, required this.image, required this.about});

  @override
  State<CounsellorDetailPage> createState() => _CounsellorDetailPageState();
}

class _CounsellorDetailPageState extends State<CounsellorDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: 16.w,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.arrow_back,
              color: textColor,
            ),
          ),
          // SizedBox(height: 14.h,),
          Center(
              child: customText("Counselor", textColor, 22, FontWeight.w500)),
          SizedBox(
            height: 19.h,
          ),

          counsellorDetailPagePart(
            
              widget.name,
              widget.fee,
              widget.exp,
              widget.field,
              widget.rate,
              widget.image,
              widget.about),
          Spacer(),
          customButton(40, double.infinity, 12, primary2, Colors.white,
              "Book Appointment", 16, FontWeight.w600, 0, 0, () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ScheduleAppointment(
                        mobile:widget.mobile,
                          exp: widget.exp,
                          field: widget.field ,
                          image:
                              widget.image,
                          rating:widget.rate,
                          name: widget.name,
                        )));
          }),
          Spacer()
        ]),
      ),
    );
  }
}
