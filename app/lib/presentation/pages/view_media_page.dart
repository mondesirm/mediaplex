import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lecle_yoyo_player/lecle_yoyo_player.dart';

import 'package:mediaplex/utils/constants.dart';

class ViewMediaPage extends StatefulWidget {
  final String source;
  const ViewMediaPage({ super.key, required this.source });

  @override
  State<ViewMediaPage> createState() => _ViewMediaPageState();
}

class _ViewMediaPageState extends State<ViewMediaPage> {
  @override
  Widget build(BuildContext context) {
   var aspectRatio =   MediaQuery.of(context).orientation == Orientation.portrait ? 16 / 9 : 1.0;

    return Scaffold(
      body: widget.source.isNotEmpty
        ? Center(
          child: YoYoPlayer(
            aspectRatio: aspectRatio,
            url: widget.source,
            videoStyle: const VideoStyle(playIcon: Icon(CupertinoIcons.play_circle), pauseIcon: Icon(CupertinoIcons.play_circle)),
            videoLoadingStyle: const VideoLoadingStyle(
              loading: Center(
                child: Column(
                children: [
                  CircularProgressIndicator(backgroundColor: whiteColor),
                  SizedBox(height: 10.0),
                  Text('Loading Video', style: TextStyle(color: whiteColor))
                ]
              ))
            )
          )
        )
        : const Center(child: Text('Source Down', style: TextStyle(color: whiteColor)))
    );
  }
}