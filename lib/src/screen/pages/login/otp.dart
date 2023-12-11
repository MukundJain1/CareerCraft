import 'package:careercraft/src/screen/pages/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../user_info/section.dart';


class OTP extends StatefulWidget {
  const OTP({super.key});


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
      textStyle: TextStyle(fontSize: 30, color:Colors.black, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: Color(0xFFE5D4FF),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
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
              child:Image.asset('assets/icons/otp4.jpg'),),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Text(
                "Enter Verification Code",
                style: TextStyle(

                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25
                ),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Text(
                "We are automatically detecting a SMS send to your mobile number ****81",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                    fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 68,
              // PinPut

              child:Pinput(
                defaultPinTheme: defaultPinTheme,
                length: 6,
                showCursor: true,
                onChanged: (value){
                  smsCode = value;
                },
              ),
            ),
        SizedBox(
          height: 10,
        ),
        Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
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
            SizedBox(height: 60.0),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: SizedBox(
                  width: 150,
                  height: 60,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.pink),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      )),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                      ),
                    ),
                    onPressed: () async{
                      // Verify the verification code and navigate to the next screen.
                      try {
                        if (LoginPage.verifyCode != null) {
                          PhoneAuthCredential credential = PhoneAuthProvider.credential(
                            verificationId: LoginPage.verifyCode,
                            smsCode: smsCode,
                          );
                          await auth.signInWithCredential(credential);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>UserFormPage()));
                        } else {
                          // Handle the case when verification code is null
                          print('Verification code is null');
                        }
                      } catch (e) {
                        print('Wrong OTP: $e');
                        // Handle the case of wrong OTP
                      }
                    },
                    child: Row(
                      children: [
                        Text(
                          'Continue',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 17.0),
                        ),
                        SizedBox(width:4.0),
                        Icon(Icons.arrow_forward_ios, size: 16.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
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