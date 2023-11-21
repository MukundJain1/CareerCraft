import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:careercraft/src/screen/pages/login/components/country_code.dart';
import 'package:careercraft/src/utils/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  String? cc = '+91';

  DropdownButton dropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (int i = 0; i < countryCodeList.length; i++) {
      var countryCode = countryCodeList[i];
      var newItem = DropdownMenuItem(
        child: Text(countryCode,style: TextStyle(color: Colors.black,fontSize: 18),),
        value: countryCode,
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton(
        value: cc,
        items: dropdownItems,
        onChanged: (value) {
          setState(() {
            cc = value;
          });
        });
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    controller.forward();
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 250.h,
                margin: EdgeInsets.all(0),
                child:
                    Image.asset('assets/icons/coverpage.png', fit: BoxFit.cover),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Text(
                    'Welcome To',
                    style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText(
                            'CareerCraft',
                            textStyle: TextStyle(
                              fontSize: 33.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ),
                            speed: const Duration(milliseconds: 150),
                          ),
                        ],
                      ),
                      Hero(
                        tag: 'logo',
                        child: Container(
                          child: Image.asset('assets/icons/logo.png'),
                          height: 70.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 18.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 2.0, color: Colors.purpleAccent),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 6.0,
                          spreadRadius: 3.0,
                          color: Colors.purpleAccent.shade100,
                          // color: Colors.grey,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 30,),
                        Text(
                          "Enter your phone number",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text("Please confirm your country code \nand your phone number",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.grey,fontSize: 14),),
                        SizedBox(
                          height: 40.h,
                        ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20.0, 5.0, 5, 0),
                          height: 50,
                          padding: EdgeInsets.only(bottom: 10),
                          child: dropdown(),
                        ),
                        SizedBox(
                          width: 220.w,
                          height: 40.0,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                              hintText: 'Enter your mobile number',
                              border: OutlineInputBorder(),
                            ),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                          height: 30.h,
                        ),
                        customButton(35, 170, 20, Colors.purpleAccent.shade400, Colors.white, "Submit", 28, FontWeight.w700, 1, 1, () => null),
                        SizedBox(height: 30.h,),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
// import 'package:flutter/material.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   //creating an instance
//   State<LoginPage> createState() => _MobileNumberTextFieldState();
// }
//
// class _MobileNumberTextFieldState extends State<LoginPage> {
//   //2 TextEditingController objects
//   //TextEditingController() to manage  the text entered and take care of changes made by user
//   final _countryCodeController = TextEditingController();
//   final _mobileNumberController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Text('Country code'),
//           SizedBox(width: 10),
//           TextField(
//             controller: _countryCodeController,
//             keyboardType: TextInputType.phone,
//             decoration: InputDecoration(
//               hintText: '+91',
//               border: OutlineInputBorder(),
//             ),
//           ),
//           SizedBox(height: 10),
//           Row(
//             children: [
//               Text('Mobile number'),
//               SizedBox(width: 10),
//               SizedBox(
//                 width: 100.0,
//                 child: TextField(
//                   controller: _mobileNumberController,
//                   keyboardType: TextInputType.phone,
//                   decoration: InputDecoration(
//                     hintText: 'Enter your mobile number',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 10),
//           ElevatedButton(
//             onPressed: () {},
//             child: Text('CONTINUE'),
//           ),
//         ],
//       ),
//     );
//   }
// }
