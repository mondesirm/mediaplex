import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'movie_detail_page.dart';
import 'package:mediaplex/utils/constants.dart';
import 'package:mediaplex/data/movies/movies.dart';
import 'package:mediaplex/presentation/widgets/list_screen.dart';
import 'package:mediaplex/presentation/widgets/error_widget.dart';
import 'package:mediaplex/presentation/bloc/movie_list_page_bloc/movielistpage_bloc.dart';

class MovieListPage extends StatefulWidget {
  final String categoryUrl;
  final String categoryName;
  const MovieListPage({ super.key, required this.categoryUrl, required this.categoryName });

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  static const hintText = 'Enter Movie Name';
  static const titleGeneralError = 'An Error Occurred';
  static const titleNetworkError = 'No Internet Connection';

  late MovieListPageBloc _movieListPageBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _movieListPageBloc = MovieListPageBloc()..add(GetMovieListBaseOnCategory(categoryUrl: widget.categoryUrl));
  }

  @override
  void dispose() { _movieListPageBloc.close(); super.dispose(); }

  void retryFunction() async { _movieListPageBloc.add(GetMovieListBaseOnCategory(categoryUrl: widget.categoryUrl)); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(widget.categoryName, style: logoTextStyle)),
      body: BlocConsumer<MovieListPageBloc, MovieListPageState>(
        bloc: _movieListPageBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is MovieListPageLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieListPageLoadedState) {
            return ListScreen(
              list: state.movieList,
              hintText: hintText,
              navigationFunction: (movie) {
                return Navigator.push(context, MaterialPageRoute(builder: (context) { return MovieDetailPage(movie: movie as Movie); }));
              }
            );
          } else if (state is MovieListPageNoInternetState) {
            return CustomeErrorWidget(retryFunction: retryFunction, errorTitle: titleNetworkError);
          } else {
            return CustomeErrorWidget(retryFunction: retryFunction, errorTitle: titleGeneralError);
          }
        }
      )
    );
  }
}