import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mediaplex/utils/constants.dart';

class SearchBar extends StatefulWidget {
  final String hintText;
  final Function(String)? onChanged;
  const SearchBar({ super.key, required this.hintText, required this.onChanged, });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController textEditingController;

  @override
  void initState() { super.initState(); textEditingController = TextEditingController(); }

  @override
  void dispose() { textEditingController.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      decoration: BoxDecoration(color: Colors.white.withOpacity(.05), borderRadius: BorderRadius.circular(50.0)),
      child: TextField(
        enableSuggestions: true,
        cursorColor: darkBlueColor,
        controller: textEditingController,
        style: TextStyle(color: Colors.white.withOpacity(.8)),
        decoration: InputDecoration(
          border: InputBorder.none,
          focusColor: darkBlueColor,
          hintText: widget.hintText,
          prefixIcon: InkWell(child: const Icon(CupertinoIcons.search, color: darkBlueColor), onTap: () { FocusScope.of(context).unfocus(); }),
          suffixIcon: textEditingController.text.isNotEmpty
            ? InkWell(
                child: const Icon(CupertinoIcons.clear, color: Colors.redAccent),
                onTap: () {
                  textEditingController.clear();
                  widget.onChanged!('');
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              )
            : null
        ),
        onChanged: widget.onChanged
      )
    );
  }
}