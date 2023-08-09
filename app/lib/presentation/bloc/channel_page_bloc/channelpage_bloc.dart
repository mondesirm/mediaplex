import 'dart:io';
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mediaplex/data/channels/channel.dart';
import 'package:mediaplex/domain/repositories/network_repo.dart';

part 'channelpage_event.dart';
part 'channelpage_state.dart';

class ChannelPageBloc extends Bloc<ChannelPageEvent, ChannelPageState> {
  ChannelPageBloc() : super(const ChannelPageLoadingState()) {
     on<GetChannelListData>(_onStarted);
  }

  Future<void> _onStarted(GetChannelListData event, Emitter<ChannelPageState> emit) async {
    emit(const ChannelPageLoadingState());

    try {
      final List<Channel> channelList = await NetworkRepo().indianChannelList();
      emit(ChannelPageLoadedState(channelList: channelList));
    } on IOException {
      emit(const ChannelPageNoInternetState());
    } catch (e) {
      // print(e.toString());
      emit(const ChannelPageErrorState());
    }
  }
}