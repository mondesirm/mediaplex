import 'package:flutter/material.dart';

import 'channel_card.dart';
import 'package:mediaplex/utils/constants.dart';
import 'package:mediaplex/data/channels/channel.dart';
import 'package:mediaplex/presentation/pages/view_media_page.dart';

class ChannelScreen extends StatefulWidget {
  const ChannelScreen({ super.key, required this.size, required this.channelList });

  final Size size;
  final List<Channel> channelList;

  @override
  State<ChannelScreen> createState() => _ChannelScreenState();
}

class _ChannelScreenState extends State<ChannelScreen> {
  List<Channel> channels = [];

  @override
  void initState() { super.initState(); channels = widget.channelList; }

  void onSearchBarValueChangeFunction(String searchText) {
    final searchedChannels = widget.channelList.where((channel) {
      final searchTextToLowerCase = searchText.toLowerCase();
      final channelNameToLowerCase = channel.name.toLowerCase();

      return channelNameToLowerCase.contains(searchTextToLowerCase);
    }).toList();

    setState(() { channels = searchedChannels; });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          sized10,
          SearchBar(hintText: searchChannels, onChanged: onSearchBarValueChangeFunction),
          sized10,
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 20.0, mainAxisSpacing: 20.0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: channels.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) { return ViewMediaPage(source: channels[index].url); })); },
                    child: ChannelCard(channelName: channels[index].name, channelLogo: channels[index].logo, size: widget.size)
                  );
              }
            )
          )
        ]
      )
    );
  }
}