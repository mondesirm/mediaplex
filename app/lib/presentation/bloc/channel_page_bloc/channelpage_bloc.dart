import 'dart:io';
import 'dart:async';

// import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mediaplex/data/channels/channel.dart';
import 'package:mediaplex/domain/repositories/network_repo.dart';

part 'channelpage_event.dart';
part 'channelpage_state.dart';

class ChannelPageBloc extends Bloc<ChannelPageEvent, ChannelPageState> {
  ChannelPageBloc() : super(const ChannelPageLoadingState());

  Stream<ChannelPageState> mapEventToState(ChannelPageEvent event) async* {
    if (event is GetChannelListData) {
      yield const ChannelPageLoadingState();

      try {
        final List<Channel> channelList = await NetworkRepo().indianChannelList();
        yield ChannelPageLoadedState(channelList: channelList);
      } on IOException {
        yield const ChannelPageNoInternetState();
      } catch (e) {
        // print(e.toString());
        yield const ChannelPageErrorState();
      }
    }
  }
}