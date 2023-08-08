import 'dart:io';
import 'dart:async';

// import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mediaplex/data/movies/movies.dart';
import 'package:mediaplex/domain/repositories/network_repo.dart';

part 'movielistpage_event.dart';
part 'movielistpage_state.dart';

class MovieListPageBloc extends Bloc<MovieListPageEvent, MovieListPageState> {
  MovieListPageBloc() : super(const MovieListPageLoadingState());

  Stream<MovieListPageState> mapEventToState(MovieListPageEvent event) async* {
    yield const MovieListPageLoadingState();

    if (event is GetMovieListBaseOnCategory) {
      try {
        final List<Movie> moviesList = await NetworkRepo().getMovieCategoryList(event.categoryUrl);
        yield MovieListPageLoadedState(moviesList: moviesList);
      } on IOException {
        yield const MovieListPageNoInternetState();
      } catch (e) {
        yield const MovieListPageErrorState();
      }
    }
  }
}