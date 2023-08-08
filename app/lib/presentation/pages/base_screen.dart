import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'home_page.dart';
import 'channels/channel_page.dart';
import 'movies/movies_categories_page.dart';
import 'series/series_categories_page.dart';
import 'package:mediaplex/utils/constants.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({ super.key });

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  var currentScreen = 0;

  static const _screenList = [HomePage(), ChannelPage(), MoviesCategoriesPage(), SeriesCategoriesPage()];

  void changeScreen(int newScreenValue) { setState(() { currentScreen = newScreenValue; }); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: _screenList.elementAt(currentScreen)),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.tv), label: 'Tv Channel'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.film), label: 'Movies'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.tickets), label: 'Series')
        ],
        backgroundColor: darkGreyColor,
        currentIndex: currentScreen,
        onTap: changeScreen,
        selectedItemColor: darkBlueColor,
        selectedLabelStyle: const TextStyle(color: whiteColor),
        unselectedItemColor: whiteColor
      )
    );
  }
}