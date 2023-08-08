import 'package:flutter/material.dart';

import 'package:mediaplex/utils/constants.dart';
import 'package:mediaplex/data/movies/movies_categories.dart';
import 'package:mediaplex/presentation/widgets/categories_widget.dart';
import 'package:mediaplex/presentation/pages/movies/movies_list_page.dart';

class MoviesCategoriesPage extends StatefulWidget {
  const MoviesCategoriesPage({ super.key });

  @override
  State<MoviesCategoriesPage> createState() => _MoviesCategoriesPageState();
}

class _MoviesCategoriesPageState extends State<MoviesCategoriesPage> {
  var movieCategoriesList = movieCategories;

  @override
  void initState() { super.initState(); }

  void onSearchBarValueChangeFunction(String searchText) {
    final searchedChannels = movieCategories.where((category) {
      final searchTextToLowerCase = searchText.toLowerCase();
      final categoryNameToLowerCase = category.categoryName.toLowerCase();

      return categoryNameToLowerCase.contains(searchTextToLowerCase);
    }).toList();

    setState(() { movieCategoriesList = searchedChannels; });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Movies Categories', style: logoTextStyle)
      ),
      body: CategoriesWidget(
        onSearchBarValueChangeFunction: onSearchBarValueChangeFunction,
        categoriesList: movieCategoriesList,
        onTapNavigate: (categoryUrl, categoryName) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return MovieListPage(categoryUrl: categoryUrl, categoryName: categoryName);
          }));
        }
      )
    );
  }
}