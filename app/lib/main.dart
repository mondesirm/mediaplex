import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'notifiers.dart';
import 'theme/app_theme.dart';
import 'presentation/screens/base_screen.dart';

void main() { runApp(const MyApp()); }

class MyApp extends StatelessWidget {
  const MyApp({ super.key });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(428, 926),
      builder: (context, child) => ChangeNotifierProvider(
        create: (context) => ThemeNotifier(),
        child: Consumer<ThemeNotifier>(
          builder: (context, ThemeNotifier themeNotifier, child) => MaterialApp(
            title: 'mediaplex',
            home: const BaseScreen(),
            debugShowCheckedModeBanner: false,
            theme: themeNotifier.isDark ? AppTheme.darkMode : AppTheme.lightMode
            // theme: ThemeData(
            //   useMaterial3: true,
            //   // fontFamily: 'Mukta',
            //   hintColor: whiteColor,
            //   scaffoldBackgroundColor: backgroundColor,
            //   iconTheme: const IconThemeData(color: whiteColor),
            //   appBarTheme: const AppBarTheme(backgroundColor: darkGreyColor),
            //   // colorScheme: ColorScheme.fromSwatch().copyWith(secondary: whiteColor),
            //   // bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: darkGreyColor),
            //   elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent))),
            //   colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE5A00D))
            // )
          )
        )
      )
    );
  }
}

class WordPairNotifier extends ChangeNotifier {
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

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({ super.key });

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<WordPairNotifier>();
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
    var appState = context.watch<WordPairNotifier>();

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
  /// Needed so that [WordPairNotifier] can tell [AnimatedList] below to animate new items
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
    final appState = context.watch<WordPairNotifier>();
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