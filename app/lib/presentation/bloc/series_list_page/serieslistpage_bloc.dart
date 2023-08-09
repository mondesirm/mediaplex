import 'dart:io';
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mediaplex/data/series/series.dart';
import 'package:mediaplex/domain/repositories/network_repo.dart';

part 'serieslistpage_event.dart';
part 'serieslistpage_state.dart';

class SeriesListPageBloc extends Bloc<SeriesListPageEvent, SeriesListPageState> {
  SeriesListPageBloc() : super(const SeriesListPageLoadingState()) {
     on<GetSeriesListBaseOnCategory>(_onStarted);
  }

  Future<void> _onStarted(GetSeriesListBaseOnCategory event, Emitter<SeriesListPageState> emit) async {
    emit(const SeriesListPageLoadingState());

    try {
      final List<Series> seriesList = await NetworkRepo().getSeriesCategoryList(event.categoryUrl);
      emit(SeriesListPageLoadedState(seriesList: seriesList));
    } on IOException {
      emit(const SeriesListPageNoInternetState());
    } catch (e) {
      // print(e.toString());
      emit(const SeriesListPageErrorState());
    }
  }
}