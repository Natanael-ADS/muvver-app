import 'package:flutter/material.dart';
import 'package:muvver_app/modules/core/constant/image_const.dart';
import 'package:muvver_app/modules/core/styles/color_theme.dart';

class CustomButtonWithImage extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final String message;
  final String pathImage;

  const CustomButtonWithImage({
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
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(ColorTheme.SECOND),
        ),
        child: SizedBox(
          height: 129,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 8, right: 20, top: 8, bottom: 8),
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
    double? height, width = 0;

    if (pathImage == ImageConst.BOX_2) {
      height = 43;
      width = 40;
    }
    if (pathImage == ImageConst.TRUCK_2) {
      height = 30;
      width = 56;
    }
    return Image.asset(
      pathImage,
      height: height,
      width: width,
    );
  }
}
