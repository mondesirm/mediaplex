//? Fix this
// ignore_for_file: file_names
// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'package:mediaplex/utils/constants.dart';

class GridCard extends StatelessWidget {
  final String name;
  final String logoUrl;

  const GridCard({ super.key, required this.name, required this.logoUrl });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 200.0,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      gradient:const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [darkBlueColor, darkGreyColor])),
      child: Column(children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
              image: DecorationImage(image: AssetImage(logoUrl), fit: BoxFit.cover)
            )
          )
        ),
        sized5,
        RichText(text: TextSpan(text: name, style: listTitleStyle)),
        sized5
      ])
    );
  }
}