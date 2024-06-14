import 'package:flutter/material.dart';
import 'package:neru_lending_app/utils/constant_colors.dart';

class IndustryCard extends StatelessWidget {
  const IndustryCard({super.key, required this.image, required this.text});
  final String image;
  final String text;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: ConstantColors.transparentWhiteColor,
        ),
        child: Column(
          children: [
            Image.asset(image, width: 120, height: 100,),
            const SizedBox(height: 10,),
            Text(text, style: const TextStyle(fontSize: 20, color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
