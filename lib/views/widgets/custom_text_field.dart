import 'package:URBANPRO/utils/app__text_style.dart';
import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum InputType { phone, email, name, address }

class CommonTextField extends StatefulWidget {
  final InputType inputType;
  final TextEditingController controller;
  final Function(String) onChanged;
  final String label;
  final String hint;
  final bool readOnly;
  final bool autofocus;
  final double? borderRadius;
  final double? height;
  final Color? borderColor;
  final IconData? icon;
  final IconData? suffixicon;
  final String? Function(String?)? validator;
  final int? maxLines;
  final FocusNode? focusNode;

  const CommonTextField({
    super.key,
    required this.inputType,
    required this.controller,
    required this.onChanged,
    required this.label,
    this.validator,
    required this.hint,
    this.readOnly = false,
    this.autofocus = false,
    this.borderRadius,
    this.height,
    this.borderColor,
    this.icon,
    this.suffixicon,
    this.maxLines,
    this.focusNode,
  });

  @override
  _CommonTextFieldState createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  late List<TextInputFormatter> _inputFormatters;
  late TextInputType _keyboardType;

  @override
  void initState() {
    super.initState();
    _setInputType();
  }

  void _setInputType() {
    switch (widget.inputType) {
      case InputType.phone:
        _keyboardType = TextInputType.phone;
        _inputFormatters = [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(10),
        ];
        break;
      case InputType.email:
        _keyboardType = TextInputType.emailAddress;
        _inputFormatters = [];
        break;
      case InputType.name:
        _keyboardType = TextInputType.name;
        _inputFormatters = [
          FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z\s]")),
        ];
        break;
      case InputType.address:
        _keyboardType = TextInputType.streetAddress;
        _inputFormatters = [];
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color defaultBorderColor = widget.borderColor ?? ThemeConstants.grey;

    return TextFormField(
      focusNode: widget.focusNode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofocus: widget.autofocus,
      controller: widget.controller,
      keyboardType: _keyboardType,
      inputFormatters: _inputFormatters,
      readOnly: widget.readOnly,
      onChanged: widget.onChanged,
      validator: widget.validator,
      maxLines: widget.maxLines,
      style: TextStyle(
        color: widget.readOnly ? Colors.grey : ThemeConstants.grey,
        letterSpacing: 1.5,
      ),
      decoration: InputDecoration(
        suffixIcon: widget.suffixicon != null
            ? Icon(widget.suffixicon, color: ThemeConstants.grey)
            : null,
        prefixIcon: widget.icon != null
            ? Icon(widget.icon, color: ThemeConstants.grey)
            : null,
        labelText: widget.label,
        hintText: widget.hint,
        labelStyle: AppTextStyle.Text16600.copyWith(
          color: widget.readOnly ? Colors.grey : ThemeConstants.grey,
        ),
        hintStyle: AppTextStyle.Text14400.copyWith(
          color: widget.readOnly ? Colors.grey : Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.0),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: AppTextStyle.Text16600.copyWith(
          color: widget.readOnly ? Colors.grey : ThemeConstants.secondaryColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.borderColor ?? Colors.grey[300]!,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 16.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: defaultBorderColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 16.0),
        ),
        contentPadding:
            EdgeInsets.symmetric(vertical: widget.height ?? 16, horizontal: 20),
      ),
    );
  }
}
