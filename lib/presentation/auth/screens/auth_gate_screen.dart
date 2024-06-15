import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neru_lending_app/presentation/auth/screens/login_screen.dart';
import 'package:neru_lending_app/presentation/dashboard/screens/dashboard_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const DashboardScreen(); // If session is active and valid, navigate to dashboard
            } else {
              return const LoginScreen(); // If session is terminated, navigate to login; when user logs out.
            }
          },
        ));
  }
}
