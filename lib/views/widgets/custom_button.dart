import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Widget? icon;
  final double borderRadius;
  final bool left;
  final double? width;
  final double? height;
  final double hPadding; // Horizontal padding
  final double vPadding; // Vertical padding
  final Color? borderColor; // Optional border color
  final Color baseTextColor; // Base text color
  final double fontSize; // Font size

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = ThemeConstants.primaryColor,
    this.textColor = Colors.white,
    this.icon,
    this.borderRadius = 30.0,
    this.left = false,
    this.width,
    this.height,
    this.hPadding = 14.0, // Default horizontal paddin
    this.vPadding = 0.0, // Default vertical padding
    this.borderColor,
    this.baseTextColor = Colors.black,
    this.fontSize = 14.0,
  });

  @override
  Widget build(BuildContext context) {
    final buttonWidth = width;
    return SizedBox(
      width: buttonWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(
            horizontal: hPadding,
            vertical: vPadding,
          ),
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: borderColor != null
                ? BorderSide(color: borderColor!)
                : BorderSide.none, 
          ),
          elevation: 0, 
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (left && icon != null) ...[
              icon!, 
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: TextStyle(
                fontSize: fontSize, 
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            if (!left && icon != null) ...[
              const SizedBox(width: 8),
              icon!,
              const SizedBox(width: 8),
            ],
          ],
        ),
      ),
    );
  }
}
