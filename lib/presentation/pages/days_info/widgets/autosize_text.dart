import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;

  const CustomText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: AutoSizeText(
        text,
        style: const TextStyle(color: Colors.white),
        maxLines: 1,
        maxFontSize: 14,
      ),
    );
  }
}
