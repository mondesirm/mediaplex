import 'dart:io';
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mediaplex/data/movies/movies.dart';
import 'package:mediaplex/data/coming_soon/coming_soon.dart';
import 'package:mediaplex/domain/repositories/network_repo.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  static final networkRepo = NetworkRepo();
  HomePageBloc() : super(const HomePageLoadingState()) {
     on<GetHomePageData>(_onStarted);
  }

  Future<void> _onStarted(GetHomePageData event, Emitter<HomePageState> emit) async {
    emit(const HomePageLoadingState());

    try {
      // print(DateTime.now().toString());

      // final value = await Future.wait([
      //   networkRepo.trendingList(),
      //   networkRepo.getFeaturedBanner(),
      //   networkRepo.newArrivalList(),
      //   networkRepo.getComingSoonList()]);

      // for (var element in value) {
      //   print(element.toString());
      //   element.forEach((subelement) {
      //     print(subelement.toString());
      //   });
      // }

      // print(DateTime.now().toString());

      final List trendingList = await networkRepo.trendingList();
      final Movie featuredBanner = await networkRepo.getFeaturedBanner();
      final List newArrivals = await networkRepo.newArrivalList();
      final List<ComingSoon> comingSoonList = await networkRepo.getComingSoonList();

      // print(DateTime.now().toString());

      emit(HomePageLoadedState(
        trendingList: trendingList,
        featuredBanner: featuredBanner,
        newArrivals: newArrivals,
        comingSoonList: comingSoonList));
    } on IOException {
      emit(const HomePageNoInternetState());
    } catch (_) {
      // print(e.toString());
      emit(const HomePageErrorState());
    }
  }
}