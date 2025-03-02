import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

const List<String> _list = ["Admin", "Student", "Teacher"];

class SimpleDropdown extends StatefulWidget {
  final ValueChanged<String> onSelectedValueChanged; // Callback to pass the selected value
  final String initialValue;

  const SimpleDropdown({super.key, required this.onSelectedValueChanged, required this.initialValue});

  @override
  _SimpleDropdownState createState() => _SimpleDropdownState();
}

class _SimpleDropdownState extends State<SimpleDropdown> {
  late String _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue.isNotEmpty ? widget.initialValue : _list[0];
  }

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<String>(
      closedHeaderPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      expandedHeaderPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      listItemPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      decoration: CustomDropdownDecoration(
        closedBorder: Border.all(
          width: 1,
          color: ThemeConstants.lightGrey,
        ),
        closedBorderRadius: BorderRadius.circular(16),
        // listItemStyle: AppTextStyle.simpleText14500,
        headerStyle: TextStyle(
          color: ThemeConstants.grey,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
      hintText: 'Select job role',
      items: _list,
      initialItem: _selectedValue,  // Set initial item value from _selectedValue
      onChanged: (value) {
        log('Changing value to: $value');
        setState(() {
          _selectedValue = value ?? _list[0]; // Update the selected value
        });

        widget.onSelectedValueChanged(_selectedValue); // Pass the selected value to the parent
      },
    );
  }
}
