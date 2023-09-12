import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({ super.key });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    // void onPressed() => () => Navigator.pushNamed(context, '/sign-in');
    onPressed() => {};

    return SizedBox(
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset('images/logo.svg', height: 100),
          Text('No risk, all reward', style: textTheme.headlineSmall),
          Text('Get instant, anywhere access to thousands of free films and programmes, Live TV & your own media.', style: textTheme.titleLarge),
          ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(200, 50)),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.white.withOpacity(.1)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
            ),
            child: const Padding(padding: EdgeInsets.all(10), child: Text('Sign In'))
          )
        ]
      )
    );
  }
}