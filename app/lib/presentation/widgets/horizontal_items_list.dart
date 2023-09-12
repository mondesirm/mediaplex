import 'package:flutter/material.dart';

import 'package:mediaplex/utils/constants.dart';
import 'package:mediaplex/presentation/screens/view_media_page.dart';

class HorizontalItemsList extends StatelessWidget {
  final String listTitle;
  final List list;
  const HorizontalItemsList( { super.key, required this.listTitle, required this.list });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(listTitle, style: listTitleStyle), Text('(${list.length})', style: listTitleStyle)]
          ),
          Container(
            height: 170.0,
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) { return ViewMediaPage(source: list[index].url); })); },
                  child: Container(
                    width: 100.0,
                    height: 150.0,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      image: DecorationImage(image: NetworkImage(list[index].logo), fit: BoxFit.contain)
                    )
                  )
                );
              }
            )
          )
        ]
      )
    );
  }
}