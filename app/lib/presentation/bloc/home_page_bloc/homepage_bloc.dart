import 'dart:io';
import 'dart:async';

// import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mediaplex/data/movies/movies.dart';
import 'package:mediaplex/data/coming_soon/coming_soon.dart';
import 'package:mediaplex/domain/repositories/network_repo.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  static final networkRepo = NetworkRepo();
  HomePageBloc() : super(const HomePageLoadingState());

  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    if (event is GetHomePageData) {
      yield const HomePageLoadingState();

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

        yield HomePageLoadedState(
            trendingList: trendingList,
            featuredBanner: featuredBanner,
            newArrivals: newArrivals,
            comingSoonList: comingSoonList);
      } on IOException {
        yield const HomePageNoInternetState();
      } catch (e) {
        // print(e.toString());
        yield const HomePageErrorState();
      }
    }
  }
}