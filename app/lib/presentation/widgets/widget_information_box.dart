import 'package:flutter/material.dart';

import 'package:mediaplex/utils/constants.dart';

class WidgetInformationBox extends StatelessWidget {
  const WidgetInformationBox({ super.key, required this.width, required this.text, required this.title, });

  final String text;
  final double width;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.05)),
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 15.0, color: whiteColor),
          children: <TextSpan>[TextSpan(text: title), TextSpan(text: text, style: const TextStyle(fontWeight: FontWeight.bold))]
        )
      )
    );
  }
}