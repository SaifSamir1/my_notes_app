import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText,
      required this.controller,
      this.maxLength,
      this.containerHeight,
      required this.validator,
        this.onSaved});

  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextEditingController controller;
  final int? maxLength;
  final double? containerHeight;
  final FormFieldValidator validator;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 13, top: 5, right: 10),
      height: containerHeight?.h ?? 60.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        shape: BoxShape.rectangle,
      ),
      child: TextFormField(
        onSaved: onSaved,
        validator: validator,
        maxLines: maxLength ?? 1,
        textAlign: TextAlign.start,
        controller: controller,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: prefixIcon,
            hintText: hintText ?? '',
            suffixIcon: suffixIcon),
      ),
    );
  }
}
