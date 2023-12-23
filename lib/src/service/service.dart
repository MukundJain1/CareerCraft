import 'package:careercraft/src/screen/home/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/customWidget.dart';

class UserDatabaseManager {
  Future<void> submitInterest(
    String mobile,
    String section,
    String clas,
    String category,
    String interest,
    BuildContext context,
  ) async {
    CustomWidget().showProgress(context: context);

    try {
      String iid = DateTime.now().millisecondsSinceEpoch.toString();
      await FirebaseFirestore.instance
          .collection("user_interest")
          .doc(iid)
          .set({
        "id": iid,
        "mobile": mobile,
        "section": section,
        "class": clas,
        "category": category,
        "interest": interest,
      });

      CustomWidget().hidProgress(context: context);

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomePage()),
        (Route<dynamic> route) => false,
      );
    } catch (error) {
      print("Error adding data: $error");
    }
  }

  Future<bool> doesUserAlreadyExist(String name) async {
  print(name);
  final QuerySnapshot result = await FirebaseFirestore.instance
      .collection('user_interest')
      .where('mobile', isEqualTo: name)
      .limit(1)
      .get();
  final List<DocumentSnapshot> documents = result.docs;
  //print(result.docs);
  return documents.length == 1;
}

clearSavedData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}
setLoginTrue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool("isLogin", true);
}

setPhoneNumber(String mobile) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("phone", mobile);
}
  // final CollectionReference doctorList =
  //     FirebaseFirestore.instance.collection('doctors');

  // Future getUserList(String phoneNumber) async {
  //   List itemsList = [];
  //   try {
  //     await doctorList.where('mobile', isEqualTo: phoneNumber).get().then((querySnapshot) {
  //       querySnapshot.docs.forEach((element) {
  //         itemsList.add(element.data());
  //       });
  //     });
  //     return itemsList;
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  // final CollectionReference appointmentList =
  //     FirebaseFirestore.instance.collection('appointments');

  // Future getAppointmentList(String phoneNumber) async {
  //   List itemsList = [];
  //   try {
  //     await appointmentList.where('doctor', isEqualTo: phoneNumber).get().then((querySnapshot) {
  //       querySnapshot.docs.forEach((element) {
  //         itemsList.add(element.data());
  //       });
  //     });
  //     return itemsList;
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  // final CollectionReference patientList =
  //     FirebaseFirestore.instance.collection('userDetail');

  // Future getPatientList(String phoneNumber) async {
  //   List itemsList = [];
  //   try {
  //     await patientList.where('phonenumber', isEqualTo: phoneNumber).get().then((querySnapshot) {
  //       querySnapshot.docs.forEach((element) {
  //         itemsList.add(element.data());
  //       });
  //     });
  //     return itemsList;
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }
}
