import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neru_lending_app/presentation/auth/widgets/login_field.dart';
import 'package:neru_lending_app/presentation/button.dart';
import 'package:neru_lending_app/presentation/dashboard/screens/dashboard_screen.dart';
import 'package:neru_lending_app/utils/constant_colors.dart';
import 'package:neru_lending_app/utils/constant_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            gradient: gradient
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Sign In!", style: TextStyle(color: Pallete.whiteColor, fontSize: 35, fontFamily: ConstantFonts.workSansSemiBold),),
                const Text("Happy to see you back!", style: TextStyle(color: Pallete.whiteColor, fontSize: 12),),
                const SizedBox(height: 40,),
                const LoginField(hintText: "Username"),
                const SizedBox(height: 15,),
                const LoginField(hintText: "Password"),
                const SizedBox(height: 15,),
                Button(text: "Login", onTap: (){
                  Get.to(const DashboardScreen());
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
