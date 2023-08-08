import 'package:flutter/material.dart';

import 'grid_card.dart';
import 'package:mediaplex/utils/constants.dart';

class CategoriesWidget extends StatelessWidget {
  final List categoriesList;
  final Function(String, String) onTapNavigate;
  final Function(String)? onSearchBarValueChangeFunction; //? Complete this function like in 'channel_screen.dart'

  const CategoriesWidget({ super.key, required this.onSearchBarValueChangeFunction, required this.categoriesList, required this.onTapNavigate });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        sized10,
        SearchBar(hintText: searchCategories, onChanged: onSearchBarValueChangeFunction),
        sized10,
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: categoriesList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => onTapNavigate(categoriesList[index].categoryUrl, categoriesList[index].categoryName),
              child: GridCard(name: categoriesList[index].categoryName, logoUrl: categoriesList[index].categoryLogo)
            );
          }
        )
      ]
    );
  }
}