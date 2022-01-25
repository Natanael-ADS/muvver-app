import 'package:flutter/material.dart';
import 'package:muvver_app/modules/core/styles/color_theme.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final double widthPercent;
  final void Function()? onTap;
  final Widget? prefixIcon;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
    required this.widthPercent,
    this.onTap,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * (widthPercent / 100),
      child: TextField(
        controller: controller,
        cursorColor: ColorText.SECOND,
        decoration: InputDecoration(
          labelStyle: const TextStyle(color: ColorText.SECOND),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorText.PRIMARY),
          ),
          prefixIcon: prefixIcon,
          label: Text(
            label,
            style: const TextStyle(fontSize: 16, color: ColorText.PRIMARY),
          ),
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorText.PRIMARY),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
