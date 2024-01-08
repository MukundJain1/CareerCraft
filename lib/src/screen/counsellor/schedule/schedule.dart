import 'package:careercraft/constant/constant.dart';
import 'package:careercraft/src/screen/counsellor/components/component.dart';
import 'package:careercraft/src/utils/utils.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduleAppointment extends StatefulWidget {
  final String mobile, name, field, exp, rating, image;
  const ScheduleAppointment(
      {Key? key,
      required this.mobile,
      required this.exp,
      required this.field,
      required this.name,
      required this.rating,
      required this.image})
      : super(key: key);

  @override
  State<ScheduleAppointment> createState() => _ScheduleAppointmentState();
}

class _ScheduleAppointmentState extends State<ScheduleAppointment> {
  int? _currentIndex;
  bool _dateSelected = false;
  bool _timeSelected = false;
  DateTime? selectedDate;
  String time = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.w),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: textColor,
                    ),
                  ),
                  // SizedBox(height: 10.h,),
                  Center(
                      child: customText(
                          "Appointment", Colors.black, 22, FontWeight.w600)),
                  SizedBox(
                    height: 14.h,
                  ),

                  counsellorDetailPart(widget.name, widget.exp, widget.field,
                      widget.rating, widget.image),
                  customText("Select Date", Colors.black, 19, FontWeight.w500),
                  SizedBox(
                    height: 10.h,
                  ),
                  EasyDateTimeLine(
                    initialDate: DateTime.now(),
                    onDateChange: (selectedDate) {
                      selectedDate = selectedDate;
                    },
                    activeColor: primary2,
                    headerProps: const EasyHeaderProps(
                      monthPickerType: MonthPickerType.switcher,
                      monthStyle: TextStyle(color: Colors.black),
                      selectedDateFormat: SelectedDateFormat.fullDateDMY,
                    ),
                    dayProps: const EasyDayProps(
                      height: 76.0,
                      width: 50.0,
                      dayStructure: DayStructure.dayNumDayStr,
                      // inactiveDayDecoration: ,
                      inactiveDayStyle: DayStyle(
                        borderRadius: 12.0,
// decoration: BoxDecoration(
//                           border: Border(
//                               bottom: BorderSide(color: Colors.grey),
//                               top: BorderSide(color: Colors.grey),
//                               left: BorderSide(color: Colors.grey),
//                               right: BorderSide(color: Colors.grey)),
//                           ),
                        // decoration: BoxDecoration(border: ),
                        dayNumStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),

                      activeDayStyle: DayStyle(
                        borderRadius: 12,
                        dayNumStyle: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10.h,
                  ),
                  customText(
                      "Available Slots", Colors.black, 19, FontWeight.w500),
                  SizedBox(
                    height: 10.h,
                  )
                ],
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        time =
                            '${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}';
                        _currentIndex = index;
                        _timeSelected = true;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _currentIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        color: _currentIndex == index ? primary2 : null,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _currentIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
                childCount: 8,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.5,
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  customButton(40, double.infinity, 12, primary2, Colors.white,
                      "Confirm Booking", 14, FontWeight.w600, 0, 0, () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
