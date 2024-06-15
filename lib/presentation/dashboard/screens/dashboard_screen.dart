import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:neru_lending_app/presentation/dashboard/controllers/industry_controller.dart';
import 'package:neru_lending_app/presentation/dashboard/widgets/counter_balance_text.dart';
import 'package:neru_lending_app/presentation/dashboard/widgets/industry_card.dart';
import 'package:neru_lending_app/presentation/dashboard/widgets/shimmer_list.dart';
import 'package:neru_lending_app/utils/constant_colors.dart';
import 'package:neru_lending_app/utils/constant_fonts.dart';

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
              onPressed: () {},
              tooltip: "Logout",
              icon: Icon(
                Icons.output_outlined,
                color: ConstantColors.whiteColor,
              ))
        ],
      ),
      drawer: const Drawer(
        child: Center(
          child: Text("Drawer"),
        ),
      ),
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
                            final data = docs[index];
                            return IndustryCard(image: data['imageUrl'], text: data['title']);
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
        context: context,
        builder: (BuildContext context) => Container(
              decoration: const BoxDecoration(
                color: Color(0xffFFEBEB),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text(
                        "How to use your business coins?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff121515),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Text(
                      "Here some ways you use your coins",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff0e0e0e),
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                      ],
                    ),
                    SizedBox(height: 26),
                  ],
                ),
              ),
            ));
  }
}
