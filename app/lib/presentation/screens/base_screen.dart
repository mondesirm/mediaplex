import 'package:flutter/material.dart';
import 'package:uicons_regular_rounded/uicons_regular_rounded.dart';

import 'home_screen.dart';
import 'sign_in_screen.dart';
import 'channels/channel_page.dart';
import 'movies/movies_categories_page.dart';
import 'series/series_categories_page.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({ super.key });

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  var index = 0;

  final screens = [
    // { 'icon': Icons.abc, 'label': 'Word Generator', 'widget': const GeneratorPage() },
    // { 'icon': Icons.favorite, 'label': 'Favorites', 'widget': const FavoritesPage() },
    { 'icon': const UIconsRR().user, 'label': 'Sign In', 'widget': const SignInScreen() },
    { 'icon': const UIconsRR().home, 'label': 'Home', 'widget': const HomeScreen() },
    { 'icon': const UIconsRR().screen, 'label': 'Live TV', 'widget': const ChannelPage() },
    { 'icon': const UIconsRR().film, 'label': 'Movies', 'widget': const MoviesCategoriesPage() },
    { 'icon': const UIconsRR().ticket, 'label': 'Shows', 'widget': const SeriesCategoriesPage() }
  ];

  void onTap(int value) => setState(() => index = value);

  @override
  Widget build(BuildContext context) {
    Widget activeWidget;

    if (index >= screens.length) throw UnimplementedError('No widget for index $index');
    activeWidget = screens[index]['widget'] as Widget;

    var mainArea = AnimatedSwitcher(duration: const Duration(milliseconds: 200), child: activeWidget);

    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 450) {
          // Mobile-friendly layout with BottomNavigationBar
          return Column(
            children: [
              Expanded(child: Container(
                decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage('images/bg/sign-in.png'))),
                child: Padding(padding: const EdgeInsets.all(28), child: mainArea)
              )),
              SafeArea(
                child: BottomNavigationBar(
                  onTap: onTap,
                  currentIndex: index,
                  //? showUnselectedLabels is false on small devices
                  // showUnselectedLabels: false,
                  type: BottomNavigationBarType.fixed,
                  // backgroundColor: const Color(0xFF333333),
                  // selectedItemColor: const Color(0xFFE5A00D),
                  // unselectedItemColor: const Color(0xFFADADAD),
                  items: screens.map((screen) => BottomNavigationBarItem(
                    label: screen['label'] as String,
                    icon: Icon(screen['icon'] as IconData)
                    // activeIcon: Icon(screen['activeIcon'] as IconData)
                  )).toList()
                )
              )
            ]
          );
        } else {
          // Tablet / Desktop layout with NavigationRail
          return Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  selectedIndex: index,
                  minExtendedWidth: 200,
                  onDestinationSelected: onTap,
                  extended: constraints.maxWidth >= 600,
                  // backgroundColor: const Color(0xFF333333),
                  // selectedIconTheme: const IconThemeData(color: Color(0xFFE5A00D)),
                  // unselectedIconTheme: const IconThemeData(color: Color(0xFFADADAD)),
                  destinations: screens.map((screen) => NavigationRailDestination(
                    icon: Icon(screen['icon'] as IconData),
                    label: Text(screen['label'] as String, style: const TextStyle(color: Colors.white))
                    // activeIcon: Icon(screen['activeIcon'] as IconData)
                  )).toList()
                )
              ),
              Expanded(child: Container(
                decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage('images/bg/sign-in.png'))),
                child: Padding(padding: const EdgeInsets.all(28), child: mainArea)
              ))
            ]
          );
        }
      })
    );
  }
}