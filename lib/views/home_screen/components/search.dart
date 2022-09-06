import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying
  List<String> searchKeyWords = [
    "Man",
    "Luxury",
    "Classic",
    "Women",
    "Sports",
    "Fashion",
    "Casual",
  ];

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Color(0xffEFEFEF),
        toolbarHeight: 70,
        elevation: 0,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.black,
      ),
      textTheme: const TextTheme(
        headline6: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.close,
          color: Colors.black,
        ),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchKeyWords) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchKeyWords) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
