import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 26.0),
        child: SearchBar(
          textStyle: MaterialStatePropertyAll(TextStyle(
            fontSize: 17,
            fontFamily: "LibreFranklin",
          )),
          elevation: MaterialStatePropertyAll(0),
          shadowColor: MaterialStatePropertyAll(Colors.red),
          backgroundColor: MaterialStatePropertyAll(Color(0xFFF9F9F9)),
          hintText: "Search",
          leading: Icon(Icons.search),
        ));
  }
}
