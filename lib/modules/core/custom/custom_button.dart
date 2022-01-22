import 'package:flutter/material.dart';
import 'package:muvver_app/modules/core/styles/color_theme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: SizedBox(
          height: 48,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
              title,
              style: const TextStyle(
                color: ColorText.THIRD,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
