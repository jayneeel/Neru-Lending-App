import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neru_lending_app/presentation/dashboard/screens/industry_details_screen.dart';
import 'package:neru_lending_app/utils/constant_colors.dart';


class IndustryCard extends StatelessWidget {
  const IndustryCard({super.key, required this.image, required this.text});
  final String image;
  final String text;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => Get.to(()=> const IndustryDetailsScreen()),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: ConstantColors.transparentWhiteColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(image, width: 160, height: 100, fit: BoxFit.fill,)),
              const SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(text, style: const TextStyle(fontSize: 16, color: Colors.white),),
                  const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
