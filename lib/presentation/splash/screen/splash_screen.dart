import 'package:flutter/material.dart';
import 'package:neru_lending_app/utils/constant_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: ConstantColors.transparentWhiteColor, borderRadius: BorderRadius.circular(20)),
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 180,
                    height: 180,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
