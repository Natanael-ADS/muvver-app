import 'package:flutter/material.dart';

class CustomRadio extends StatefulWidget {
  final String pathImage;
  final String nameImage;
  final dynamic valueRadio;
  final int valueGroupRadio;
  final void Function(dynamic) onChanged;

  const CustomRadio({
    Key? key,
    required this.pathImage,
    required this.nameImage,
    required this.valueRadio,
    required this.valueGroupRadio,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomRadio> createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0x2222221F)),
        ),
      ),
      child: SizedBox(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Row(
                children: [
                  Image.asset(widget.pathImage, height: 32, width: 32),
                  const SizedBox(width: 20),
                  Text(widget.nameImage),
                ],
              ),
            ),
            Radio(
              value: widget.valueRadio,
              groupValue: widget.valueGroupRadio,
              onChanged: widget.onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
