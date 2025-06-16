import 'package:flutter/material.dart';
import 'package:uber_clone_app/common/color_extension.dart';

class LineTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? right;
  const LineTextField(
      {super.key,
      required this.title,
      required this.hintText,
      this.controller,
      this.keyboardType,
      required this.obscureText,
      required this.right});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: TColor.primaryText, fontSize: 14),
        ),
        SizedBox(
          height: 30,
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText ?? false,
            style: TextStyle(
              color: TColor.primaryText,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: hintText,
              suffixIcon: right,
              hintStyle: TextStyle(
                color: TColor.placeHolder,
                fontSize: 16,
              ),
            ),
          ),
        ),
        Container(
          color: TColor.primary,
          height: 0.5,
          width: double.maxFinite,
        )
      ],
    );
  }
}
