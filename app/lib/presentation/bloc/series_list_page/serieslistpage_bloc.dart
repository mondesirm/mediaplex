import 'dart:io';
import 'dart:async';

// import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mediaplex/data/series/series.dart';
import 'package:mediaplex/domain/repositories/network_repo.dart';

part 'serieslistpage_event.dart';
part 'serieslistpage_state.dart';

class SeriesListPageBloc extends Bloc<SeriesListPageEvent, SeriesListPageState> {
  SeriesListPageBloc() : super(const SeriesListPageLoadingState());

  Stream<SeriesListPageState> mapEventToState(SeriesListPageEvent event) async* {
    yield const SeriesListPageLoadingState();

    if (event is GetSeriesListBaseOnCategory) {
      try {
        final List<Series> seriesList = await NetworkRepo().getSeriesCategoryList(event.categoryUrl);
        yield SeriesListPageLoadedState(seriesList: seriesList);
      } on IOException {
        yield const SeriesListPageNoInternetState();
      } catch (e) {
        yield const SeriesListPageErrorState();
      }
    }
  }
}