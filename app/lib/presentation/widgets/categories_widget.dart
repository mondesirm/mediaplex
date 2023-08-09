import 'package:flutter/material.dart';

import 'grid_card.dart';
import 'package:mediaplex/utils/constants.dart';

class CategoriesWidget extends StatelessWidget {
  final List categoriesList;
  final Function(String)? onSearch;
  final Function(String, String) onTapNavigate;

  const CategoriesWidget({ super.key, required this.onSearch, required this.categoriesList, required this.onTapNavigate });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        sized10,
        SearchBar(hintText: searchCategories, onChanged: onSearch),
        sized10,
        GridView.builder(
          shrinkWrap: true,
          itemCount: categoriesList.length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => onTapNavigate(categoriesList[index].categoryUrl, categoriesList[index].categoryName),
            child: GridCard(name: categoriesList[index].categoryName, logoUrl: categoriesList[index].categoryLogo))
        )
      ]
    );
  }
}