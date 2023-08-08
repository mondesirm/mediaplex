import 'package:flutter/material.dart';

import 'package:mediaplex/data/coming_soon/coming_soon.dart';

class ComingSoonBanner extends StatelessWidget {
  final Size size;
  final List<ComingSoon> comingSoonList;
  const ComingSoonBanner({ super.key, required this.size, required this.comingSoonList });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.25,
      child: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: comingSoonList.length,
          itemBuilder: (context, index) {
            return Container(
              width: size.width * 0.8,
              height: size.height * 0.25,
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: NetworkImage(comingSoonList[index].logo),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop)
                )
              ),
              child: Center(
                child: Text(comingSoonList[index].name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 24.0))
              )
            );
          }
        )
      )
    );
  }
}