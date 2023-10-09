import 'package:flutter/material.dart';
import 'package:herry_up/core/data/search.dart';
import 'package:herry_up/task4/view/model.dart';

// TODO : search about sliverSearch and override for his methode

// ? when you done , use SearchingEntity().searchingMethode that return list of result
// https://www.youtube.com/watch?v=KF1KMfQOpjM

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyApp"),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
    );
  }
}
