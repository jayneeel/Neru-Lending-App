import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:neru_lending_app/presentation/dashboard/widgets/counter_balance_text.dart';
import 'package:neru_lending_app/presentation/dashboard/widgets/industry_card.dart';
import 'package:neru_lending_app/utils/constant_colors.dart';
import 'package:neru_lending_app/utils/constant_fonts.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Pallete.whiteColor,
          ),
          tooltip: "Menu",
          onPressed: () {},
        ),
        backgroundColor: ConstantColors.gradientBeginColor,
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
      body: Container(
        decoration: BoxDecoration(
          gradient: gradient,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LiveBalanceCard(),
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
                      stream: FirebaseFirestore.instance.collection("industries").snapshots(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                        if (snapshot.hasError) return Text('Error = ${snapshot.error}');
                        if (snapshot.hasData){
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
                        return const Center(child: CircularProgressIndicator());
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
  });

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
                    const CounterBalanceText(
                      begin: 0,
                      end: 6525.2,
                      duration: Duration(seconds: 2),
                      prefix: "\$ ",
                      precision: 2,
                      style: TextStyle(color: Pallete.whiteColor, fontSize: 20),
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
}
