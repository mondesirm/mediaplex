import 'package:flutter/material.dart';

import 'grid_card.dart';

class ListScreen extends StatefulWidget {
  final List list;
  final Function(Object) navigationFunction;
  final String hintText;
  const ListScreen({ super.key, required this.list, required this.navigationFunction, required this.hintText });

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List itemList = [];

  @override
  void initState() { super.initState(); itemList = widget.list; }

  void onSearchBarValueChangeFunction(String searchText) {
    final searched = widget.list.where((item) {
      final searchTextToLowerCase = searchText.toLowerCase();
      final listItemNameToLowerCase = item.name.toLowerCase();

      return listItemNameToLowerCase.contains(searchTextToLowerCase);
    }).toList();

    setState(() { itemList = searched; });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const SliverToBoxAdapter(child: SizedBox(height: 10.0)),
      SliverToBoxAdapter(child: SearchBar(hintText: widget.hintText, onChanged: onSearchBarValueChangeFunction)),
      const SliverToBoxAdapter(child: SizedBox(height: 10.0)),
      SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 20.0, mainAxisSpacing: 20.0),
        delegate: SliverChildBuilderDelegate((context, index) {
            return GestureDetector(
              onTap: () => widget.navigationFunction(itemList[index]),
              child: GridCard(name: itemList[index].name, logoUrl: itemList[index].logo)
            );
          },
          childCount: itemList.length
        )
      )
    ]);
  }
}