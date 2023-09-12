// import 'package:flutter/material.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// // import 'home/homescreenview.dart';
// // import 'package:pancake/more/morescreenbody.dart';
// // import 'package:pancake/shared/customvalues.dart';
// // import 'package:pancake/shared/customwidgets.dart';
// // import 'package:pancake/search/searchscreenbody.dart';

// class Homescreen extends StatefulWidget {
//   const Homescreen({ super.key, required index });

//   @override
//   State<Homescreen> createState() => _HomescreenState();
// }

// class _HomescreenState extends State<Homescreen> {
//   var Screens = [
//     // const Homescreenbody(),
//     // const Searchscreenbody(),
//     // const Morescreenbody()
//   ];

//   final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     return CurvedNavigationBar(
//       height: 60.0,
//       index: widget.index,
//       key: _bottomNavigationKey,
//       color: Colors.white10,
//       letIndexChange: (index) => true,
//       animationCurve: Curves.easeInOut,
//       backgroundColor: Colors.transparent,
//       buttonBackgroundColor: Colors.white10,
//       onTap: (value) => setState(() => index = value),
//       animationDuration: const Duration(milliseconds: 600),
//       items: <Widget>[
//         Icon(Icons.home, size: 30, color: uppermodecolor),
//         Icon(Icons.search, size: 30, color: uppermodecolor),
//         Icon(Icons.menu, size: 30, color: uppermodecolor),
//       ]
//     );
//   }
// }