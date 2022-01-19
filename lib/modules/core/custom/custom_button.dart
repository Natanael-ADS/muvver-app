import 'package:flutter/material.dart';
import 'package:muvver_app/modules/core/styles/color_theme.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final String message;
  final String pathImage;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.message,
    required this.pathImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _button();
  }

  Widget _button() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
      child: ElevatedButton(
        onPressed: () => onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(ColorTheme.SECOND),
        ),
        child: SizedBox(
          height: 129,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_messageButton(), _image()],
            ),
          ),
        ),
      ),
    );
  }

  Widget _messageButton() {
    return SizedBox(
      width: 180,
      child: Column(
        children: [
          const SizedBox(height: 25),
          Center(
            child: Text(
              title,
              style: const TextStyle(
                color: ColorText.THIRD,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              message,
              style: const TextStyle(
                color: ColorText.THIRD,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _image() {
    return Image.asset(
      pathImage,
      height: 43,
    );
  }
}
