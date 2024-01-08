import 'package:careercraft/constant/constant.dart';
import 'package:careercraft/src/screen/counsellor/components/component.dart';
import 'package:careercraft/src/screen/counsellor/counsellor/counsellor_detail.dart';
import 'package:careercraft/src/service/service.dart';
import 'package:careercraft/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Counsellor extends StatefulWidget {
  const Counsellor({super.key});

  @override
  State<Counsellor> createState() => _CounsellorState();
}

class _CounsellorState extends State<Counsellor> {
  List expertList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDatabaseList();
  }

  fetchDatabaseList() async {
    dynamic resultant = await UserDatabaseManager().getExpertList();
    if (resultant == null) {
      print("Unable to retrieve");
    } else {
      setState(() {
        expertList = resultant;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        customText("Experts", Colors.black, 26, FontWeight.w700),
        SizedBox(
          height: 10.h,
        ),
        customText("\"Meet Our Experts:", Colors.black, 17, FontWeight.w600),
        SizedBox(
          height: 4.h,
        ),
        customText("Guiding Your Path to EXcellence!\"", Colors.black, 17,
            FontWeight.w600),
        SizedBox(
          height: 24.h,
        ),
        expertList.length == 0
            ? Container(
                height: 300.h,
                width: 300.w,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(color: Colors.pink),
              )
            : Expanded(
                child: ListView.builder(
                  itemCount: expertList!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 6.w),
                        child: expertCard(
                            expertList![index]['mobile'],
                            expertList![index]['image'],
                            expertList![index]['name'],
                            expertList![index]['fee'],
                            expertList![index]['exp'],
                            expertList![index]['intro'],
                            expertList![index]['rating'],
                            expertList![index]['field'],
                            expertList![index]['about'],
                            context));
                  },
                ),
              ),
      ]),
    ));
  }
}
