import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

const List<String> _list = ["Admin", "Teacher", "Student"];

class SimpleDropdown extends StatefulWidget {
  final ValueChanged<int> onSelectedValueChanged; // Change callback to return integer ID
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

  // Function to map role to integer ID
  int _getRoleId(String role) {
    switch (role) {
      case "Admin":
        return 1;
      case "Teacher":
        return 2;
      case "Student":
        return 3;
      default:
        return 0; // Default case, just in case something unexpected occurs
    }
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

        // Map the selected role to an integer ID and pass it to the parent
        widget.onSelectedValueChanged(_getRoleId(_selectedValue));
      },
    );
  }
}
