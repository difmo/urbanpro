import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Applogo extends StatelessWidget {
  final double width; 

  const Applogo({super.key, this.width = 250});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width, 
      child: SvgPicture.asset('assets/icons/applogo.svg'),
    );
  }
}
