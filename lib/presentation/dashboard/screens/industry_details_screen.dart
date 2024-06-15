import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neru_lending_app/utils/constant_colors.dart';
import 'package:neru_lending_app/utils/constant_fonts.dart';

import '../widgets/button.dart';

class IndustryDetailsScreen extends StatelessWidget {
  const IndustryDetailsScreen({super.key, required this.data});
  final data;     // Data fetched from firebase snapshot which is Key-Value pair

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantColors.gradientStopColor,
        title: const Text("Details", style: TextStyle(color: Colors.white),),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new_rounded, color: ConstantColors.whiteColor,), onPressed: (){
          Get.back();
        },),
      ),
      body: SafeArea(child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: gradient
        ),
        child: Column(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(data['imageUrl'])),
          const SizedBox(height: 20,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            decoration: BoxDecoration(
              color: ConstantColors.transparentWhiteColor,
              borderRadius: BorderRadius.circular(35)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data['title'], style: TextStyle(fontSize: 35, fontFamily: ConstantFonts.workSansMedium, color: ConstantColors.whiteColor),),
                const SizedBox(height: 10,),
                Text(data['description'], maxLines: 10,style: TextStyle(overflow: TextOverflow.ellipsis,fontFamily: ConstantFonts.workSansRegular, color: Colors.grey[100], fontSize: 14,), textAlign: TextAlign.justify,),
                const SizedBox(height: 30,),
                Button(text: "Learn More", onTap: (){},)
              ],
            ),
          )
        ],),
      )),
    );
  }
}
