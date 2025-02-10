import 'package:URBANPRO/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonHeight = 45;
    double buttonFontSize = 16;
    double iconSize = 22;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor, // Change the button color here
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonHeight * 0.5),
        ),
        minimumSize: Size(screenWidth * 0.1, buttonHeight),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: buttonFontSize,
              color: AppColors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Icon(
            Icons.arrow_circle_right_outlined,
            color: Colors.white,
            size: iconSize,
          )
        ],
      ),
    );
  }
}
