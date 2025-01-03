import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  const ReusableText(
      {super.key, required this.text, required this.style, this.overflow});

  final String text;
  final TextStyle style;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      overflow: overflow,
    );
  }
}
