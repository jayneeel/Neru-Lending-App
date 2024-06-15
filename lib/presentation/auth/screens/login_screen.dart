import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neru_lending_app/presentation/auth/widgets/login_field.dart';
import 'package:neru_lending_app/presentation/dashboard/widgets/button.dart';
import 'package:neru_lending_app/presentation/dashboard/screens/dashboard_screen.dart';
import 'package:neru_lending_app/utils/constant_colors.dart';
import 'package:neru_lending_app/utils/constant_fonts.dart';

import '../controller/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());            // AuthController
    final TextEditingController emailController = TextEditingController();      // Controller for Email Field
    final TextEditingController passwordController = TextEditingController();   // Controller for Password Field
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
                LoginField(hintText: "Username", controller: emailController, obscureText: false,),
                const SizedBox(height: 15,),
                 LoginField(hintText: "Password", controller: passwordController, obscureText: true,),
                const SizedBox(height: 15,),
                Button(text: "Login", onTap: () async {
                  try {
                    UserCredential userCredential = await authController.signInWithEmailAndPassword(emailController.text.toString(), passwordController.text.toString());
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Successful!")));
                    Get.to(const DashboardScreen());    // if user is authenticated ; navigate to Dashboard
                  } catch (e) {
                    print('Error signing in: $e');
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
