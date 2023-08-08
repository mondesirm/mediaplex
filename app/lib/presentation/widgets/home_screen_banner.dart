import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mediaplex/utils/constants.dart';
import 'package:mediaplex/presentation/pages/view_media_page.dart';

class HomeScreenBanner extends StatelessWidget {
  final Size size;
  final dynamic featuredBanner;
  static const String watch = 'Watch';
  const HomeScreenBanner({ super.key, required this.size, required this.featuredBanner });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.7,
      child: Stack(
        children: [
          Container(
            height: size.height,
            width: double.infinity,
            decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(featuredBanner.logo), fit: BoxFit.fill))
          ),
          Positioned(
            left: 0.0,
            top: size.height * 0.7,
            child: SizedBox(
              width: size.width,
              child: Center(
                child: GestureDetector(
                  onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (context) { return ViewMediaPage(source: featuredBanner.url); })); },
                  child: Container(
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Colors.black, style: BorderStyle.solid),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(.7), blurRadius: 3.0, spreadRadius: 0.5)]
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(padding: EdgeInsets.only(left: 10.0), child: Icon(CupertinoIcons.play, color: Colors.black)),
                          Padding(padding: EdgeInsets.only(right: 10.0), child: Text(watch, style: TextStyle(fontWeight: FontWeight.w700)))
                        ]
                      )
                    )
                  )
                )
              )
            )
          )
        ]
      )
    );
  }
}