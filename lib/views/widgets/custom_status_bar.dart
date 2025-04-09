import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:flutter/material.dart';

class CustomStatusBar extends StatelessWidget {
  const CustomStatusBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeConstants.primaryColor,
      alignment: Alignment.center,
    );
  }
}
