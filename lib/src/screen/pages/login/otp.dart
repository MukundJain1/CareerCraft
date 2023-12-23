import 'package:careercraft/constant/constant.dart';
import 'package:careercraft/src/screen/home/home.dart';
import 'package:careercraft/src/screen/pages/login/login.dart';
import 'package:careercraft/src/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../../service/service.dart';
import '../../../utils/customWidget.dart';
import '../user_info/section.dart';

class OTP extends StatefulWidget {
  final String mobile;
  OTP({super.key, required this.mobile});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  String smsCode = "";
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
          fontSize: 30, color: Colors.black, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: const Color(0xFFE5D4FF),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(234, 239, 243, 1),
            blurRadius: 5.0,
            spreadRadius: 1.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
    );

    // final focusedPinTheme = defaultPinTheme.copyWith(
    //   decoration: defaultPinTheme.decoration?.copyWith(
    //     border: Border.all(color: Color(0xFFE5D4FF)),
    //     borderRadius: BorderRadius.circular(8),
    //   ),
    // );
    //
    // final submittedPinTheme = defaultPinTheme.copyWith(
    //   decoration: defaultPinTheme.decoration?.copyWith(
    //     color: Color(0xFFE5D4FF),
    //   ),
    // );

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 350,
            width: double.infinity,
            child: Image.asset('assets/icons/otp4.jpg'),
          ),
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 23),
            child: Text(
              "Enter Verification Code",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 23),
            child: Text(
              "SMS send to your mobile number ${LoginPage.mobile}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black54,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 68,
            // PinPut
    width: 300,
            child: Pinput(
              defaultPinTheme: defaultPinTheme,
              length: 6,
              showCursor: true,
              onChanged: (value) {
                smsCode = value;
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.center,
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: "Didn't receive OTP? ",
                  ),
                  TextSpan(
                    text: "Send again!",
                    style: TextStyle(
                      color: Color(0xFF1640D6),
                      // Change this to your desired color
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 60.0),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: SizedBox(
                width: 150,
                height: 60,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(primary2),
                    shape:
                        MaterialStateProperty.all(const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    )),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                    ),
                  ),
                  onPressed: () async {
                    // Verify the verification code and navigate to the next screen.
                    CustomWidget().showProgress(context: context);
                    try {
                      if (LoginPage.verify != null) {
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                          verificationId: LoginPage.verify,
                          smsCode: smsCode,
                        );
                        await auth
                            .signInWithCredential(credential)
                            .whenComplete(() =>
                                CustomWidget().hidProgress(context: context)).onError((error, stackTrace) => showToast(error.toString()));
                        await UserDatabaseManager()
                                .doesUserAlreadyExist(LoginPage.mobile)
                            ? {
                                UserDatabaseManager().setLoginTrue(),
                                UserDatabaseManager()
                                    .setPhoneNumber(widget.mobile),
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => const HomePage()),
                                    (Route<dynamic> route) => false)
                              }
                            : {
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const UserFormPage())),
                              };
                      } else {
                        // Handle the case when verification code is null
                        print('Verification code is null');
                      }
                    } catch (e) {
                      print('Wrong OTP: $e');
                      // Handle the case of wrong OTP
                    }
                  },
                  child: const Row(
                    children: [
                      Text(
                        'Continue',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17.0),
                      ),
                      SizedBox(width: 4.0),
                      Icon(Icons.arrow_forward_ios, size: 16.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

// OtpTextField(
// numberOfFields: 5,
// fillColor: Color(0xFFE5D4FF),
// showCursor: false,
// filled: true,
// fieldWidth: 56,
// borderRadius: BorderRadius.circular(15),
// //set to true to show as box or false to show as dash
// showFieldAsBox: true,
// //runs when a code is typed in
// onCodeChanged: (String code) {
// code = code;
// },
// //runs when every textfield is filled
// onSubmit: (String verificationCode){
// showDialog(
// context: context,
// builder: (context){
// return AlertDialog(
// title: Text("Verification Code"),
// content: Text('Code entered is $verificationCode'),
// );
// }
// );
// }, // end onSubmit
// ),
