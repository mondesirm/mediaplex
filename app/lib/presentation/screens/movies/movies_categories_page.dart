import 'package:flutter/material.dart';

import 'movies_list_page.dart';
import 'package:mediaplex/utils/constants.dart';
import 'package:mediaplex/data/movies/movies_categories.dart';
import 'package:mediaplex/presentation/widgets/categories_widget.dart';

class MoviesCategoriesPage extends StatefulWidget {
  const MoviesCategoriesPage({ super.key });

  @override
  State<MoviesCategoriesPage> createState() => _MoviesCategoriesPageState();
}

class _MoviesCategoriesPageState extends State<MoviesCategoriesPage> {
  var categoriesList = moviesCategories;

  @override
  void initState() { super.initState(); }

  void onSearch(String text) {
    final filtered = moviesCategories.where((category) =>
      category.categoryName.toLowerCase().contains(text.toLowerCase())
    ).toList();

    setState(() { categoriesList = filtered; });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Movies Categories', style: logoTextStyle)),
      body: CategoriesWidget(
        onSearch: onSearch,
        categoriesList: categoriesList,
        onTapNavigate: (categoryUrl, categoryName) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return MovieListPage(categoryUrl: categoryUrl, categoryName: categoryName);
          }));
        }
      )
    );
  }
}