import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class CustomDropdownWidget<T> extends StatefulWidget {
  final List<T> items;
  final ValueChanged<T> onSelectedValueChanged;
  final T? initialValue;
  final String hintText;

  const CustomDropdownWidget({
    super.key,
    required this.items,
    required this.onSelectedValueChanged,
    this.initialValue,
    this.hintText = "Select an option",
  });

  @override
  _CustomDropdownWidgetState<T> createState() =>
      _CustomDropdownWidgetState<T>();
}

class _CustomDropdownWidgetState<T> extends State<CustomDropdownWidget<T>> {
  late T _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue ?? widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<T>(
      closedHeaderPadding:
          const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      expandedHeaderPadding:
          const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      listItemPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      decoration: CustomDropdownDecoration(
        closedBorder: Border.all(width: 1, color: Colors.grey),
        closedBorderRadius: BorderRadius.circular(16),
        headerStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
      hintText: widget.hintText,
      items: widget.items,
      initialItem: _selectedValue,
      onChanged: (value) {
        if (value != null) {
          log('Changing value to: $value');
          setState(() {
            _selectedValue = value;
          });
          widget.onSelectedValueChanged(value);
        }
      },
    );
  }
}
