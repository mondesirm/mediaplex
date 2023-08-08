import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mediaplex/utils/constants.dart';
import 'package:mediaplex/presentation/widgets/error_widget.dart';
import 'package:mediaplex/presentation/widgets/channel_screen.dart';
import 'package:mediaplex/presentation/bloc/channel_page_bloc/channelpage_bloc.dart';

class ChannelPage extends StatefulWidget {
  const ChannelPage({ super.key });

  @override
  State<ChannelPage> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  static const titleGeneralError = 'Error occure';
  static const titleNetworkError = 'No Internet Connection';

  late ChannelPageBloc _channelPageBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _channelPageBloc = ChannelPageBloc()..add(const GetChannelListData());
  }

  @override
  void dispose() { _channelPageBloc.close(); super.dispose(); }

  void retryFunction() async { _channelPageBloc.add(const GetChannelListData()); }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(title: const Text('Tv Channel', style: logoTextStyle), centerTitle: true),
        body: BlocConsumer<ChannelPageBloc, ChannelPageState>(
          bloc: _channelPageBloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ChannelPageLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ChannelPageLoadedState) {
              return ChannelScreen(size: size, channelList: state.channelList);
            } else if (state is ChannelPageNoInternetState) {
              return CustomeErrorWidget(
                retryFunction: retryFunction,
                errorTitle: titleNetworkError
              );
            } else {
              return CustomeErrorWidget(
                retryFunction: retryFunction,
                errorTitle: titleGeneralError
              );
            }
          },
        ));
  }
}