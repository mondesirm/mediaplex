part of 'homepage_bloc.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

class HomePageLoadingState extends HomePageState {
  const HomePageLoadingState();

  @override
  List<Object> get props => [];
}

class HomePageLoadedState extends HomePageState {
  final List trendingList;
  final dynamic featuredBanner; //? Change dynamic type
  final List newArrivals;
  final List<ComingSoon> comingSoonList;
  const HomePageLoadedState({ required this.comingSoonList, required this.featuredBanner, required this.trendingList, required this.newArrivals });

  @override
  List<Object> get props => [trendingList, featuredBanner, newArrivals, comingSoonList];
}

class HomePageNoInternetState extends HomePageState {
  const HomePageNoInternetState();

  @override
  List<Object> get props => [];
}

class HomePageErrorState extends HomePageState {
  const HomePageErrorState();

  @override
  List<Object> get props => [];
}