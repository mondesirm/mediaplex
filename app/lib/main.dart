import 'package:flutter/material.dart';

import 'utils/constants.dart';
import 'presentation/pages/splash_screen.dart';

void main() { runApp(const MyApp()); }

class MyApp extends StatelessWidget {
  const MyApp({ super.key });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.dark,
      title: 'mediaplex',
      home: const SplashScreen(),
      // home: const MyHomePage(title: 'mediaplex'),
      theme: ThemeData(
        fontFamily: 'Mukta',
        hintColor: whiteColor,
        scaffoldBackgroundColor: backgroundColor,
        iconTheme: const IconThemeData(color: whiteColor),
        appBarTheme: const AppBarTheme(backgroundColor: darkGreyColor),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: whiteColor),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: darkGreyColor),
        elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent))),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() => setState(() { _counter++; });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text('$_counter', style: Theme.of(context).textTheme.headlineMedium)
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(onPressed: _incrementCounter, tooltip: 'Increment', child: const Icon(Icons.add))
    );
  }
}