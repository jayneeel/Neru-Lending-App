import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neru_lending_app/presentation/auth/screens/auth_gate_screen.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 1,
      width: 250,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: Image.asset('assets/images/logo.png'),
              arrowColor: Colors.black,
              accountName: const Text('Jayneel Kanungo'),
              accountEmail: const Text('info@sorfinancial.com')),
          const ListBody(
            children: [
              ListTile(
                leading: Icon(Icons.web),
                title: Text("Create my portal"),
              ),
              ListTile(
                leading: Icon(Icons.area_chart),
                title: Text("My Goals with platform"),
              ),
              ListTile(
                leading: Icon(Icons.safety_check),
                title: Text("Life Insurance"),
              ),
              ListTile(
                leading: Icon(Icons.corporate_fare),
                title: Text("Corporate credit list"),
              ),
              ListTile(
                leading: Icon(Icons.business_center),
                title: Text("Business Credit Repair"),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ListTile(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Get.showSnackbar(const GetSnackBar(title: "Sign out Successful!",));
                Get.to(const AuthScreen());
              },
                leading: const Icon(
                  Icons.logout_outlined,
                  color: Colors.red,
                ),
                title: const Text("Logout", style: TextStyle(color: Colors.red),)),
          )
        ],
      ),
    );
  }
}
