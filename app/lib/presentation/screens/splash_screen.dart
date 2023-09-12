import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

import 'base_screen.dart';
import 'package:mediaplex/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ super.key });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() { super.initState(); _animationController = AnimationController(vsync: this); }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView(
          shrinkWrap: true,
          children: [
            Lottie.asset(
              'lottie/splash.json',
              width: width,
              height: width,
              fit: BoxFit.fill,
              controller: _animationController, onLoaded: (composition) {
              _animationController..duration = composition.duration..forward().whenComplete(() => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const BaseScreen()), (route) => false
              ));
            }),
            sized30,
            const Text('mediaplex', style: logoTextStyle, textAlign: TextAlign.center)
          ]
        ))
      )
    );
  }
}