import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';

class CustomeTextField extends StatelessWidget {
  const CustomeTextField({
    super.key,
     this.controller,
     this.maxLines=1,
     this.hintText,
  });

  final TextEditingController? controller;
  final int maxLines;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,


      style: const TextStyle(
        color: CustomeColor.scaffoldBg,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        filled: true,
        fillColor: CustomeColor.whiteSecondary,
        focusedBorder: getInputBoder,
        enabledBorder: getInputBoder,
        border: getInputBoder,
        hintText: hintText,
        hintStyle: const TextStyle(color: CustomeColor.hintDark),
      ),
    );
  }

  OutlineInputBorder get getInputBoder {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    );
  }
}
