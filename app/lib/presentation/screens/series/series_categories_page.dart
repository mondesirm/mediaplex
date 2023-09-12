import 'package:flutter/material.dart';

import 'series_list_page.dart';
import 'package:mediaplex/utils/constants.dart';
import 'package:mediaplex/data/series/series_categories.dart';
import 'package:mediaplex/presentation/widgets/categories_widget.dart';

class SeriesCategoriesPage extends StatefulWidget {
  const SeriesCategoriesPage({ super.key });

  @override
  State<SeriesCategoriesPage> createState() => _SeriesCategoriesPageState();
}

class _SeriesCategoriesPageState extends State<SeriesCategoriesPage> {
  var categoriesList = seriesCategories;

  @override
  void initState() { super.initState(); }

  void onSearch(String text) {
    final filtered = seriesCategories.where((category) {
      return category.categoryName.toLowerCase().contains(text.toLowerCase());
    }).toList();

    setState(() { categoriesList = filtered; });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Series Categories', style: logoTextStyle)),
      body: CategoriesWidget(
        onSearch: onSearch,
        categoriesList: categoriesList,
        onTapNavigate: (categoryUrl, categoryName) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return SeriesListPage(categoryUrl: categoryUrl, categoryName: categoryName);
          }));
        }
      )
    );
  }
}