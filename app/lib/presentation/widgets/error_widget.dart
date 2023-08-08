import 'package:flutter/material.dart';

import 'package:mediaplex/utils/constants.dart';

class CustomeErrorWidget extends StatelessWidget {
  static const Padding errorButtonChild = Padding(
    padding: EdgeInsets.all(10.0),
    child: Text('Retry', style: TextStyle(color: whiteColor, fontSize: 20.0, fontWeight: FontWeight.w400))
  );

  final String errorTitle;
  final Function()? retryFunction;

  const CustomeErrorWidget({ super.key, required this.retryFunction, required this.errorTitle });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        decoration: BoxDecoration(color: darkGreyColor, borderRadius: BorderRadius.circular(20.0)),
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: size.width *0.7, maxWidth: size.width *0.7),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              sized30,
              Text(errorTitle, style: const TextStyle(color: whiteColor, fontSize: 25.0, fontWeight: FontWeight.w500)),
              sized30,
              ElevatedButton(onPressed: retryFunction, child: errorButtonChild),
              sized30
            ]
          )
        )
      )
    );
  }
}