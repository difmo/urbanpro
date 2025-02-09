import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? textColor;
  final Color? backgroundColor;
  final bool isButtonEnabled;
  final double? borderRadius;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? height;
  final double? paddingHorizontal;
  final IconData? suffixIcon;
  final Color? suffixIconColor;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.textColor,
    this.backgroundColor,
    this.isButtonEnabled = true,
    this.borderRadius,
    this.fontFamily,
    this.fontWeight,
    this.fontSize,
    this.height,
    this.paddingHorizontal,
    this.suffixIcon,
    this.suffixIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48.0,
      child: GestureDetector(
        onTap: isLoading ? null : onPressed,
        child: Stack(
          children: [
            // Gradient background
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.secondaryColor, AppColors.primaryColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(borderRadius ?? 60.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
              ),
            ),
            // Text or loading indicator
            Align(
              alignment: Alignment.center,
              child: isLoading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 28,
                          width: 28,
                          child: CircularProgressIndicator(
                            color: textColor ?? AppColors.white,
                            strokeWidth: 3.0,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Please wait...',
                          style: TextStyle(
                            color: textColor ?? AppColors.white,
                            fontFamily: fontFamily ?? 'Poppins',
                            fontWeight: fontWeight ?? FontWeight.w500,
                            fontSize: fontSize ?? 14.0,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          text,
                          style: TextStyle(
                            color: textColor ?? AppColors.white,
                            fontFamily: fontFamily ?? 'Poppins',
                            fontWeight: fontWeight ?? FontWeight.w600,
                            fontSize: fontSize ?? 16.0,
                          ),
                        ),
                        if (suffixIcon != null) ...[
                          SizedBox(width: 8),
                          Icon(
                            suffixIcon,
                            color:
                                suffixIconColor ?? textColor ?? AppColors.white,
                          ),
                        ],
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
