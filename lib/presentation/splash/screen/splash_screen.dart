import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neru_lending_app/presentation/auth/screens/auth_gate_screen.dart';
import 'package:neru_lending_app/presentation/auth/screens/login_screen.dart';
import 'package:neru_lending_app/utils/constant_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    startTimer(); // Timer to get to next activity
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            ConstantColors.gradientBeginColor,
            ConstantColors.gradientStopColor,
          ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: ()=> Get.to(const LoginScreen()),
                child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: ConstantColors.transparentWhiteColor, borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: 180,
                      height: 180,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void startTimer() {
    Timer(const Duration(seconds: 3), ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const AuthScreen()))); // pushReplacement removing the activity from stack
  }
}
