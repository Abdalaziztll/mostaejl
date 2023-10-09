import 'package:flutter/material.dart';
import 'package:herry_up/core/data/search.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    '111111',
    '22222222',
    '333333333',
    '444444',
    '555555',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> searchResult = [];
    for (var element in searchTerms) {
      if (element.toLowerCase().contains(query.toLowerCase())) {
        searchResult.add(element);
      }
    }
    return ListView.builder(
      itemCount: searchResult.length,
      itemBuilder: (context, index) {
        var result = searchResult[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> searchResult = [];
    for (var element in searchTerms) {
      if (element.toLowerCase().contains(query.toLowerCase())) {
        searchResult.add(element);
      }
    }
    return ListView.builder(
      itemCount: searchResult.length,
      itemBuilder: (context, index) {
        var result = searchResult[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
