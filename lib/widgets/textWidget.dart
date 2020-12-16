import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String> validator;
  final double borderRadius;
  final bool obscure;

  const MyTextFormField(
      {Key key,
      this.controller,
      this.hintText,
      this.validator,
      this.borderRadius,
      this.obscure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscure ?? false,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 20)),
            hintText: hintText ?? null),
      ),
    );
  }
}
