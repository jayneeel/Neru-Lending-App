import 'package:flutter/material.dart';

import '../../../utils/constant_fonts.dart';

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
