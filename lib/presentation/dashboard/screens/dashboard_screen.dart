import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:neru_lending_app/presentation/dashboard/controllers/industry_controller.dart';
import 'package:neru_lending_app/presentation/dashboard/screens/industry_details_screen.dart';
import 'package:neru_lending_app/presentation/dashboard/widgets/counter_balance_text.dart';
import 'package:neru_lending_app/presentation/dashboard/widgets/industry_card.dart';
import 'package:neru_lending_app/presentation/dashboard/widgets/shimmer_list.dart';
import 'package:neru_lending_app/utils/constant_colors.dart';
import 'package:neru_lending_app/utils/constant_fonts.dart';

import '../../auth/screens/auth_gate_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.put(DashboardController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantColors.gradientStopColor,
        leading: Builder(builder: (context) {
          return GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: const Icon(
              Icons.menu,
              color: Pallete.whiteColor,
            ),
          );
        }),
        title: Text(
          "Welcome",
          style: TextStyle(fontFamily: ConstantFonts.workSansMedium, color: ConstantColors.whiteColor),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Get.showSnackbar(const GetSnackBar(message: "Sign out Successful!",));
                Get.to(const AuthScreen());
              },
              tooltip: "Logout",
              icon: Icon(
                Icons.logout_outlined,
                color: ConstantColors.whiteColor,
              ))
        ],
      ),
      drawer: const SideDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: gradient,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => LiveBalanceCard(
                  balance: controller.balance.value,
                )),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Choose your",
                    style: TextStyle(fontSize: 35, color: Colors.white, fontFamily: ConstantFonts.workSansSemiBold),
                  ),
                  Row(
                    children: [
                      Text(
                        "Industry ",
                        style: TextStyle(fontSize: 35, color: Colors.white, fontFamily: ConstantFonts.workSansSemiBold),
                      ),
                      Icon(
                        Icons.arrow_downward_rounded,
                        color: Colors.white,
                        size: 50,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: ConstantColors.transparentWhiteColor.withOpacity(0.1),
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                  ),
                  child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: controller.fetchIndustries,
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                      if (snapshot.hasError) return Text('Error = ${snapshot.error}');
                      if (snapshot.hasData) {
                        final docs = snapshot.data!.docs;
                        return GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1),
                          itemBuilder: (context, index) {
                            final dataItem = docs[index];
                            return IndustryCard(image: dataItem['imageUrl'], text: dataItem['title'], onTap: (){
                              Get.to(IndustryDetailsScreen(data: dataItem,));
                            },);
                          },
                          itemCount: docs.length,
                        );
                      }
                      return const ShimmerList();
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

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
              accountEmail: const Text('kanungojayneel@gmail.com')),
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
          const Align(
            alignment: Alignment.bottomCenter,
            child: ListTile(
                leading: Icon(
                  Icons.logout_outlined,
                  color: Colors.red,
                ),
                title: Text("Logout", style: TextStyle(color: Colors.red),)),
          )
        ],
      ),
    );
  }
}

class LiveBalanceCard extends StatelessWidget {
  const LiveBalanceCard({
    super.key,
    required this.balance,
  });
  final double balance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: ConstantColors.transparentWhiteColor,
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.all(25),
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Balance",
                      style: TextStyle(
                          fontFamily: ConstantFonts.workSansMedium, color: ConstantColors.whiteColor, fontSize: 40),
                    ),
                    Row(
                      children: [
                        Text(
                          "Your Business coins",
                          style: TextStyle(
                              fontFamily: ConstantFonts.workSansMedium, color: ConstantColors.whiteColor, fontSize: 15),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () async {
                              showInfoBottomSheet(context);
                            },
                            child: const Icon(
                              Icons.info_outline,
                              color: Colors.white70,
                              size: 15,
                            ))
                      ],
                    ),
                    CounterBalanceText(
                      begin: 0,
                      end: balance,
                      duration: const Duration(seconds: 2),
                      prefix: "\$ ",
                      precision: 2,
                      style: const TextStyle(
                          color: Pallete.whiteColor, fontSize: 20, fontFamily: ConstantFonts.workSansSemiBold),
                    ),
                  ],
                ),
                Lottie.asset("assets/animations/balance_coins.json", width: 100, height: 100, fit: BoxFit.contain),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> showInfoBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
        isDismissible: true,
        context: context,
        builder: (BuildContext context) => Container(
              height: 270,
              decoration: const BoxDecoration(
                color: Color(0xfff2f4fd),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "How to use your business coins?",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: ConstantFonts.workSansSemiBold,
                            color: Color(0xff121515),
                          ),
                        ),
                        Icon(
                          Icons.cancel,
                          color: Colors.grey,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Here some ways you can use your coins",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff0e0e0e),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/coin.png",
                          width: 50,
                          height: 50,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("Buys Assets from industries",
                            style: TextStyle(fontFamily: ConstantFonts.workSansMedium, fontSize: 14)),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/earning.png",
                          width: 50,
                          height: 50,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Invest money in mutual funds",
                          style: TextStyle(fontFamily: ConstantFonts.workSansMedium, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ));
  }
}
