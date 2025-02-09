import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/colors.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color? prefixIconColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final FocusNode? focusNode;

  const CustomTextFormField({
    super.key,
    this.controller,
    required this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconColor,
    this.borderRadius,
    this.contentPadding,
    this.validator,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.focusNode,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // Light shadow color
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: _obscureText,
        onChanged: widget.onChanged,
        validator: widget.validator,
        focusNode: widget.focusNode,
        textCapitalization: widget.textCapitalization,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.keyboardType == TextInputType.phone
            ? [FilteringTextInputFormatter.digitsOnly]
            : null,
        decoration: InputDecoration(
          filled: true, // Needed for shadow to appear correctly
          fillColor: Colors.white, // Ensures field is visible over shadow
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: AppColors.grey,
            fontSize: 15,
            fontFamily: "poppins",
          ),
          prefixIcon: widget.prefixIcon != null
              ? Icon(
            widget.prefixIcon,
            color: widget.prefixIconColor ?? AppColors.primaryColor,
          )
              : null,
          suffixIcon: widget.obscureText
              ? IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: AppColors.grey,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.borderRadius ?? 15),
            ),
            borderSide: BorderSide.none, // Removes default border
          ),
          contentPadding: widget.contentPadding ??
              const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          errorMaxLines: 4,
          errorStyle: const TextStyle(
            fontSize: 12.0,
            color: AppColors.red,
            height: 1.2,
          ),
        ),
      ),
    );
  }
}
