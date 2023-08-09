part of 'movielistpage_bloc.dart';

abstract class MovieListPageState extends Equatable {
  const MovieListPageState();

  @override
  List<Object> get props => [];
}

class MovieListPageLoadingState extends MovieListPageState {
  const MovieListPageLoadingState();

  @override
  List<Object> get props => [];
}

class MovieListPageLoadedState extends MovieListPageState {
  final List<Movie> movieList;
  const MovieListPageLoadedState({ required this.movieList });

  @override
  List<Object> get props => [movieList];
}

class MovieListPageNoInternetState extends MovieListPageState {
  const MovieListPageNoInternetState();

  @override
  List<Object> get props => [];
}

class MovieListPageErrorState extends MovieListPageState {
  const MovieListPageErrorState();

  @override
  List<Object> get props => [];
}