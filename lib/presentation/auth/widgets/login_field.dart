import 'package:flutter/material.dart';

import '../../../utils/constant_colors.dart';


class LoginField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  const LoginField({
    Key? key,
    required this.hintText, required this.controller, required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(27),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white24,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Pallete.whiteColor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),

        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}