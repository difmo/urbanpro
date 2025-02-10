import 'package:URBANPRO/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.grey.withOpacity(0.3),
        width: 1.6,
      ),
      borderRadius: BorderRadius.circular(16.0),
    );

    final OutlineInputBorder selectedInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.grey,
        width: 1.6,
      ),
      borderRadius: BorderRadius.circular(16.0),
    );

    final TextStyle labelStyle = const TextStyle(
      color: AppColors.grey,
      fontWeight: FontWeight.w500,
      fontSize: 20,
      letterSpacing: 2,
    );

    final TextStyle hintStyle = TextStyle(
      color: AppColors.grey.withOpacity(0.4),
      fontWeight: FontWeight.w500,
      fontSize: 13,
      letterSpacing: 2,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: TextField(
        controller: controller,
        cursorColor: AppColors.highlight,
        style: const TextStyle(
          color: AppColors.grey,
          letterSpacing: 2,
        ),
        decoration: InputDecoration(
          labelText: label,
          hintText: 'Enter $label details',
          labelStyle: labelStyle,
          hintStyle: hintStyle,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelStyle: labelStyle,
          focusedBorder: selectedInputBorder,
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          contentPadding: const EdgeInsets.only(
            top: 0,
            bottom: 0,
            left: 10,
            right: 10,
          ),
        ),
      ),
    );
  }
}
