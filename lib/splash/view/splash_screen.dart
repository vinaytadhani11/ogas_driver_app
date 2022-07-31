// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_constructors_in_immutables

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogas_driver_app/Model/apis/pref_string.dart';
import 'package:ogas_driver_app/auth/signin.dart';
import 'package:ogas_driver_app/homescreen/home.dart';
import 'package:ogas_driver_app/util/utiliti.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? status;

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() {
    Timer(Duration(seconds: 1), () async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      status = pref.getString(PrefString.loggedIn);
      Utility.isFirstTime = pref.getString(PrefString.firstTimeUser);
      print(PrefString.loggedIn);
      print(status);
      print('status $status');

      if (status == 'loggedIn') {
        Get.offAll(HomePage());
      } else {
        Get.offAll(() => SignUpScreen(sign: false));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("asset/splash.png"), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
