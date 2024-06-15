import 'package:flutter/material.dart';
import 'package:neru_lending_app/utils/constant_colors.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.text, required this.onTap});
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: ConstantColors.transparentWhiteColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(child: Text(text, style: TextStyle(color: ConstantColors.whiteColor, fontSize: 16),)),
      ),
    );
  }
}
