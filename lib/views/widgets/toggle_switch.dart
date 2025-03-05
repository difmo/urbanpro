import 'package:flutter/material.dart';

class ToggleSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String title;

  const ToggleSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.green,
        ),
      ],
    );
  }
}
