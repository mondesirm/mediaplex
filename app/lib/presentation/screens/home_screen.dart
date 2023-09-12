import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mediaplex/utils/constants.dart';
import 'package:mediaplex/data/coming_soon/coming_soon.dart';
import 'package:mediaplex/presentation/widgets/error_widget.dart';
import 'package:mediaplex/presentation/widgets/home_screen_banner.dart';
import 'package:mediaplex/presentation/widgets/coming_soon_banner.dart';
import 'package:mediaplex/presentation/widgets/horizontal_items_list.dart';
import 'package:mediaplex/presentation/bloc/home_page_bloc/homepage_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ super.key });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const titleGeneralError = 'An Error Occurred';
  static const titleNetworkError = 'No Internet Connection';

  final HomePageBloc _homePageBloc = HomePageBloc();

  @override
  void didChangeDependencies() { super.didChangeDependencies(); _homePageBloc.add(const GetHomePageData()); }

  @override
  void dispose() { _homePageBloc.close(); super.dispose(); }

  void retryFunction() async { _homePageBloc.add(const GetHomePageData()); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomePageBloc, HomePageState>(
        bloc: _homePageBloc,
        builder: (context, state) {
          if (state is HomePageLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomePageLoadedState) {
            return WidgetHomePageLoadedState(
              newArrivals: state.newArrivals,
              trendingList: state.trendingList,
              featuredBanner: state.featuredBanner,
              commingSoonList: state.comingSoonList
            );
          } else if (state is HomePageNoInternetState) {
            return CustomeErrorWidget(retryFunction: retryFunction, errorTitle: titleNetworkError);
          } else {
            return CustomeErrorWidget(retryFunction: retryFunction, errorTitle: titleGeneralError);
          }
        }
      )
    );
  }
}

class WidgetHomePageLoadedState extends StatelessWidget {
  static const String appTitle = 'mediaplex';
  static const String titleTrending = 'Trending';
  static const String titleNewArrivals = 'New Arrivals';

  const WidgetHomePageLoadedState({ super.key, required this.newArrivals, required this.trendingList, required this.featuredBanner, required this.commingSoonList });

  final List newArrivals;
  final List trendingList;
  final dynamic featuredBanner;
  final List<ComingSoon> commingSoonList;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: NestedScrollView(
        physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              floating: true,
              centerTitle: true,
              expandedHeight: size.height * 0.8,
              title: const Text(appTitle, style: logoTextStyle),
              flexibleSpace: FlexibleSpaceBar(centerTitle: true, background: HomeScreenBanner(size: size, featuredBanner: featuredBanner)),
            )
          ];
        },
        body: ListView(
          shrinkWrap: true,
          children: [
            sized10,
            HorizontalItemsList(listTitle: titleTrending, list: trendingList),
            sized10,
            HorizontalItemsList(listTitle: titleNewArrivals, list: newArrivals),
            sized10,
            const Center(child: Text('Comming Soon', style: commingSoonTitleStyle)),
            sized20,
            ComingSoonBanner(size: size, comingSoonList: commingSoonList),
            sized20
          ]
        )
      )
    );
  }
}