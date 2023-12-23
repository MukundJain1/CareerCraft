import 'package:careercraft/constant/constant.dart';
import 'package:careercraft/src/screen/pages/login/otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:careercraft/src/screen/pages/login/components/country_code.dart';
import 'package:careercraft/src/utils/utils.dart';

import '../../../utils/customWidget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String verify = "";
  static String mobile = "";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  String? cc = '+91';
  String mobile = "";
  int? _resendToken;
  DropdownButton dropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (int i = 0; i < countryCodeList.length; i++) {
      var countryCode = countryCodeList[i];
      var newItem = DropdownMenuItem(
        child: Text(
          countryCode,
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
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

  String? phoneNumber1;

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
                child: Image.asset('assets/icons/coverpage.png',
                    fit: BoxFit.cover),
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
                      border:
                          Border.all(width: 2.0, 
                          color: Colors.purpleAccent
                          ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 1.0,
                          
                          color: Colors.purpleAccent.shade100,
                          // color: Colors.grey,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "Enter your phone number",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        // SizedBox(
                        //   height: 10.h,
                        // ),
                        // const Text(
                        //   "Please confirm your country code \nand your phone number",
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.w400,
                        //       color: Colors.grey,
                        //       fontSize: 14),
                        // ),
                        SizedBox(
                          height: 15.h,
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
                              height: 50.0,
                              child: TextField(

                                onChanged: (value) {
                                  setState(() {
                                    phoneNumber1 = value;
                                    mobile = cc! + value;
                                    LoginPage.mobile = mobile;
                                  });
                                },
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(10),
                                ],
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(

                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10),
                                  hintText: 'Mobile Number',
                                  border: OutlineInputBorder(
           
            borderSide: BorderSide(
              
                width: 1, 
                style: BorderStyle.solid,
                color: Colors.pink
            ),
            borderRadius: BorderRadius.all(Radius.circular(12))
        ),
                                  
                                ),
                                style: const TextStyle(
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
                        customButton(
                            44,
                            260,
                            15,
                            primary2,
                            Colors.white,
                            "Submit",
                            22,
                            FontWeight.w600,
                            0,
                            0, () async {
                          //************************ LOGIN CODE ********************************* */
                           CustomWidget().showProgress(context: context);
                          print(mobile);
                          await FirebaseAuth.instance.verifyPhoneNumber(
                            timeout: const Duration(seconds: 60),
                            phoneNumber: mobile,
                            verificationCompleted: (PhoneAuthCredential
                                phoneAuthCredential) async {
                              print('inside verification');
                            },
                            verificationFailed: (FirebaseAuthException e) {
                              print(e);
                              if (e.code == 'invalid-phone-number') {
                                print(
                                    'The provided phone number is not valid.');
                              }
                              print('inside verification failedf');

                              Navigator.pop(context);
                            },
                            codeSent:
                                (String verificationId, int? resendToken) {
                              LoginPage.verify = verificationId;
                              _resendToken = resendToken;
                              print(
                                  'login verification====${LoginPage.verify}');
                              Navigator.pop(context);
                              showToast("OTP Sent");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OTP(
                                    mobile: mobile,
                                  ),
                                ),
                              );
                            },
                            forceResendingToken: _resendToken,
                            codeAutoRetrievalTimeout: (String verificationId) {
                              print(verificationId);
                            },
                          );
                          //************************************************************** */
                          // await FirebaseAuth.instance.verifyPhoneNumber(
                          //   phoneNumber: '${cc! + phoneNumber1!}',
                          //   verificationCompleted:
                          //       (PhoneAuthCredential credential) {},
                          //   verificationFailed: (FirebaseAuthException e) {},
                          //   codeSent:
                          //       (String verificationId, int? resendToken) {
                          //     LoginPage.verifyCode = verificationId;
                          //     Navigator.pushNamed(context, 'otp');
                          //   },
                          //   codeAutoRetrievalTimeout:
                          //       (String verificationId) {},
                          // );
                        }),
                        SizedBox(
                          height: 30.h,
                        ),
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
