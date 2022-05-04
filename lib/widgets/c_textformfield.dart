// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class CommonTextFormField extends StatelessWidget {
  const CommonTextFormField({
    Key? key,
    this.controller,
    this.onChanged,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.validator,
    this.errorText,
  }) : super(key: key);

  final controller;
  final onChanged;
  final onTap;
  final prefixIcon;
  final suffixIcon;
  final readOnly;
  final hintText;
  final labelText;
  final obscureText;
  final validator;
  final errorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        onTap: onTap,
        validator: validator,
        obscureText: obscureText,
        readOnly: readOnly,
        decoration: InputDecoration(
          focusColor: Colors.white,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: Colors.grey,
          hintText: hintText,
          labelText: labelText,
          errorText: errorText,
        ),
      ),
    );
  }
}
