import 'dart:io';
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mediaplex/data/movies/movies.dart';
import 'package:mediaplex/domain/repositories/network_repo.dart';

part 'movielistpage_event.dart';
part 'movielistpage_state.dart';

class MovieListPageBloc extends Bloc<MovieListPageEvent, MovieListPageState> {
  MovieListPageBloc() : super(const MovieListPageLoadingState()) {
     on<GetMovieListBaseOnCategory>(_onStarted);
  }

  Future<void> _onStarted(GetMovieListBaseOnCategory event, Emitter<MovieListPageState> emit) async {
    emit(const MovieListPageLoadingState());

    try {
      final List<Movie> movieList = await NetworkRepo().getMovieCategoryList(event.categoryUrl);
      emit(MovieListPageLoadedState(movieList: movieList));
    } on IOException {
      emit(const MovieListPageNoInternetState());
    } catch (e) {
      // print(e.toString());
      emit(const MovieListPageErrorState());
    }
  }
}