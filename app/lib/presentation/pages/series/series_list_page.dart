import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mediaplex/utils/constants.dart';
import 'package:mediaplex/data/series/series.dart';
import 'package:mediaplex/presentation/widgets/list_screen.dart';
import 'package:mediaplex/presentation/widgets/error_widget.dart';
import 'package:mediaplex/presentation/pages/series/series_detail_page.dart';
import 'package:mediaplex/presentation/bloc/series_list_page/serieslistpage_bloc.dart';

class SeriesListPage extends StatefulWidget {
  final String categoryUrl;
  final String categoryName;
  const SeriesListPage({ super.key, required this.categoryUrl, required this.categoryName });

  @override
  State<SeriesListPage> createState() => _SeriesListPageState();
}

class _SeriesListPageState extends State<SeriesListPage> {
  static const hintText = 'Enter Series Name';
  static const titleGeneralError = 'An Error Occurred';
  static const titleNetworkError = 'No Internet Connection';

  late SeriesListPageBloc _seriesListPageBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _seriesListPageBloc = SeriesListPageBloc()..add(GetSeriesListBaseOnCategory(categoryUrl: widget.categoryUrl));
  }

  @override
  void dispose() { _seriesListPageBloc.close(); super.dispose(); }

  void retryFunction() async { _seriesListPageBloc.add(GetSeriesListBaseOnCategory(categoryUrl: widget.categoryUrl)); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(widget.categoryName, style: logoTextStyle)),
      body: BlocConsumer<SeriesListPageBloc, SeriesListPageState>(
        bloc: _seriesListPageBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SeriesListPageLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SeriesListPageLoadedState) {
            return ListScreen(
              list: state.seriesList,
              hintText: hintText,
              navigationFunction: (series) {
                return Navigator.push(context, MaterialPageRoute(builder: (context) { return SeriesDetailPage(series: series as Series); }));
              }
            );
          } else if (state is SeriesListPageNoInternetState) {
            return CustomeErrorWidget(retryFunction: retryFunction, errorTitle: titleNetworkError);
          } else {
            return CustomeErrorWidget(retryFunction: retryFunction, errorTitle: titleGeneralError);
          }
        }
      )
    );
  }
}