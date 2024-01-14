import 'dart:ffi';

import 'package:careercraft/src/screen/ai_bot/src/screens/homepage.dart';
import 'package:flutter/material.dart';

class CareerPage extends StatefulWidget {
  const CareerPage({super.key});

  @override
  State<CareerPage> createState() => _CareerPageState();
}

class _CareerPageState extends State<CareerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Career Page",
          style: TextStyle(color: Colors.black, fontSize: 44),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AIHomePage()));
      }),
    );
  }
}
