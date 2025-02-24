import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatefulWidget {
  final Map<T, String> itemDescriptions;
  final T selectedValue;
  final void Function(T?) onChanged;

  const CustomDropdown({
    super.key,
    required this.itemDescriptions,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  _CustomDropdownState<T> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  late T _selectedValue;
  // ignore: unused_field
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        padding: const EdgeInsets.only(left: 28, right: 28, top: 4, bottom: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: ThemeConstants.secondHeadingBlack,
            width: 1,
          ),
          color: ThemeConstants.primaryColor,
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: ThemeConstants.primaryColor,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: DropdownButtonHideUnderline(
              child: SizedBox(
                height: 28,
                child: DropdownButton<T>(
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: ThemeConstants.white,
                  ),
                  iconSize: 28,
                  elevation: 16,
                  style: const TextStyle(
                    color: ThemeConstants.white,
                  ),
                  underline: Container(
                    height: 0,
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  value: _selectedValue,
                  items: widget.itemDescriptions.entries
                      .map((MapEntry<T, String> entry) {
                    return DropdownMenuItem<T>(
                      value: entry.key,
                      child: Text(
                        entry.value,
                        style: const TextStyle(
                          color: ThemeConstants.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (T? newValue) {
                    setState(() {
                      _selectedValue = newValue as T;
                    });
                    widget.onChanged(newValue);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
