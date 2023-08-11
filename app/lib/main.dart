import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:english_words/english_words.dart';

// import 'utils/constants.dart';

void main() { runApp(const MyApp()); }

class MyApp extends StatelessWidget {
  const MyApp({ super.key });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'mediaplex',
        home: const MyHomePage(),
        theme: ThemeData(
          // fontFamily: 'Mukta',
          // hintColor: whiteColor,
          // scaffoldBackgroundColor: backgroundColor,
          // iconTheme: const IconThemeData(color: whiteColor),
          // appBarTheme: const AppBarTheme(backgroundColor: darkGreyColor),
          // colorScheme: ColorScheme.fromSwatch().copyWith(secondary: whiteColor),
          // bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: darkGreyColor),
          // elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent))),
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
        )
      )
    );
  }
}

class MyAppState extends ChangeNotifier {
  var history = <WordPair>[];
  var current = WordPair.random();

  GlobalKey? historyListKey;

  void getNext() {
    history.insert(0, current);
    var animatedList = historyListKey?.currentState as AnimatedListState?;
    animatedList?.insertItem(0);
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite([WordPair? pair]) {
    pair = pair ?? current;

    if (favorites.contains(pair)) { favorites.remove(pair); }
    else { favorites.add(pair); }

    notifyListeners();
  }

  void removeFavorite(WordPair pair) {
    favorites.remove(pair);
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({ super.key });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    Widget page;

    List<Widget> pages = const [
      GeneratorPage(),
      FavoritesPage(),
      Placeholder(),
      Placeholder(),
      Placeholder(),
      Placeholder(),
      Placeholder(),
      Placeholder(),
      Placeholder(),
      Placeholder(),
      Placeholder(),
      Placeholder(),
      Placeholder(),
      Placeholder()
    ];

    List<NavigationRailDestination> destinations = const [
      NavigationRailDestination(icon: Icon(Icons.abc), label: Text('Word Generator')),
      NavigationRailDestination(icon: Icon(Icons.favorite), label: Text('Favorites')),
      NavigationRailDestination(icon: Icon(Icons.login), label: Text('Sign In')),
      NavigationRailDestination(icon: Icon(Icons.search), label: Text('Search')),
      NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
      NavigationRailDestination(icon: Icon(Icons.tv), label: Text('Live TV')),
      NavigationRailDestination(icon: Icon(Icons.movie), label: Text('Movies')),
      NavigationRailDestination(icon: Icon(Icons.movie), label: Text('Shows')),
      NavigationRailDestination(icon: Icon(Icons.explore), label: Text('Discover')),
      NavigationRailDestination(icon: Icon(Icons.bookmark), label: Text('Watchlist')),
      NavigationRailDestination(icon: Icon(Icons.music_note), label: Text('Music')),
      NavigationRailDestination(icon: Icon(Icons.more), label: Text('More')),
      NavigationRailDestination(icon: Icon(Icons.extension), label: Text('Addons')),
      NavigationRailDestination(icon: Icon(Icons.settings), label: Text('Settings'))
    ];

    if (selectedIndex >= pages.length) throw UnimplementedError('No widget for index $selectedIndex');
    page = pages[selectedIndex];

    // The container for the current page, with its background color
    // and subtle switching animation.
    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(duration: const Duration(milliseconds: 200), child: page)
    );

    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 450) {
            // Mobile-friendly layout with BottomNavigationBar
            return Column(
              children: [
                Expanded(child: mainArea),
                SafeArea(
                  child: BottomNavigationBar(
                    currentIndex: selectedIndex,
                    onTap: (value) => setState(() => selectedIndex = value),
                    items: const [
                      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                      BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites')
                    ]
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
                    destinations: destinations,
                    selectedIndex: selectedIndex,
                    extended: constraints.maxWidth >= 600,
                    onDestinationSelected: (value) => setState(() => selectedIndex = value)
                  )
                ),
                Expanded(child: mainArea)
              ]
            );
          }
      })
    );
  }
}

class CounterPage extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() => setState(() { _counter++; });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({ super.key });

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon = appState.favorites.contains(pair) ? Icons.favorite : Icons.favorite_border;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(flex: 3, child: HistoryListView()),
          const SizedBox(height: 10),
          BigCard(pair: pair),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(icon: Icon(icon), label: const Text('Like'), onPressed: () => appState.toggleFavorite()),
              const SizedBox(width: 10),
              ElevatedButton(child: const Text('Next'), onPressed: () => appState.getNext())
            ]
          ),
          const Spacer(flex: 2)
        ]
      )
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({ super.key, required this.pair });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(color: theme.colorScheme.onPrimary);

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 200),
          child: MergeSemantics(
            child: Wrap(
              children: [
                Text(pair.first.toLowerCase(), style: style.copyWith(fontWeight: FontWeight.w200)),
                Text(pair.second.toLowerCase(), style: style.copyWith(fontWeight: FontWeight.bold))
              ]
            )
          )
        )
      )
    );
  }
}

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({ super.key });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) return const Center(child: Text('No favorites yet.'));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: const EdgeInsets.all(30), child: Text('You have ${appState.favorites.length} favorites:')),
        Expanded(
          // Make better use of wide windows with a grid
          child: GridView(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 400, childAspectRatio: 400 / 80),
            children: [
              for (var pair in appState.favorites)
                ListTile(
                  title: Text(pair.asLowerCase, semanticsLabel: pair.asPascalCase),
                  leading: IconButton(
                    color: theme.colorScheme.primary,
                    onPressed: () => appState.removeFavorite(pair),
                    icon: const Icon(Icons.delete_outline, semanticLabel: 'Delete')
                  )
                )
            ]
          )
        )
      ]
    );
  }
}

class HistoryListView extends StatefulWidget {
  const HistoryListView({ super.key });

  @override
  State<HistoryListView> createState() => _HistoryListViewState();
}

class _HistoryListViewState extends State<HistoryListView> {
  /// Needed so that [MyAppState] can tell [AnimatedList] below to animate new items
  final _key = GlobalKey();

  /// Used to "fade out" the history items at the top, to suggest continuation
  static const Gradient _maskingGradient = LinearGradient(
    stops: [0, .5],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black]
  );

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MyAppState>();
    appState.historyListKey = _key;

    // Blend gradient into the animated list
    return ShaderMask(
      shaderCallback: (bounds) => _maskingGradient.createShader(bounds),
      blendMode: BlendMode.dstIn,
      child: AnimatedList(
        key: _key,
        reverse: true,
        padding: const EdgeInsets.only(top: 100),
        initialItemCount: appState.history.length,
        itemBuilder: (context, index, animation) {
          final pair = appState.history[index];

          return SizeTransition(
            sizeFactor: animation,
            child: Center(
              child: TextButton.icon(
                onPressed: () => appState.toggleFavorite(pair),
                label: Text(pair.asLowerCase, semanticsLabel: pair.asPascalCase),
                icon: appState.favorites.contains(pair) ? const Icon(Icons.favorite, size: 12) : const SizedBox()
              )
            )
          );
        }
      )
    );
  }
}