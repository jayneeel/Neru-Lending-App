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
    final List<Map<String, dynamic>> data = [
      {"image": "assets/images/accountant.jpeg", "title": "Accountant"},
      {"image": "assets/images/medical.jpeg", "title": "Medical"},
      {"image": "assets/images/automobile.jpeg", "title": "Automobile"},
      {"image": "assets/images/medical.jpeg", "title": "Medical"},
      {"image": "assets/images/real_estate.jpeg", "title": "Real Estate"},
      {"image": "assets/images/automobile.jpeg", "title": "Automobile"},
      {"image": "assets/images/real_estate.jpeg", "title": "Real Estate"},
    ];

    const border = OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
        borderRadius: BorderRadius.horizontal(left: Radius.circular(50)));

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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
                                  fontFamily: ConstantFonts.workSansMedium,
                                  color: ConstantColors.whiteColor,
                                  fontSize: 40),
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
                        Lottie.asset("assets/animations/balance_coins.json",
                            width: 100, height: 100, fit: BoxFit.contain),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Choose your",
                style: TextStyle(fontSize: 35, color: Colors.white, fontFamily: ConstantFonts.workSansSemiBold),
              ),
              const Row(
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
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.5),
                  itemBuilder: (context, index) {
                    final industry = data[index];
                    return IndustryCard(image: industry['image'], text: industry['title']);
                  },
                  itemCount: data.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
