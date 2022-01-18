import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class Splash2 extends StatefulWidget {
  const Splash2({Key? key}) : super(key: key);

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Navigator.popAndPushNamed(context, MyRoutes.loginPage));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(500),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 50,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(500),
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          20.heightBox,
          const Text(
            "...CoReS...",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          "Manage Your Courses".text.xl.caption(context).make()
        ],
      ),
    );
  }
}
