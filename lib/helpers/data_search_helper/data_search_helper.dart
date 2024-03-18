import 'package:boilerplate/constants/matchingColors.dart';
import 'package:flutter/material.dart';

class DataSearchHelper extends SearchDelegate<String> {
  final Function(String query) callback;

  DataSearchHelper(this.callback);
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      primaryColor: MatchingColors.dark1,
      primaryIconTheme: IconThemeData(
        color: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      if (query != "")
        IconButton(
          icon: Icon(
            Icons.clear,
          ),
          onPressed: () {
            query = "";
          },
        )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  String get searchFieldLabel => "Ara";
  @override
  Widget buildResults(BuildContext context) {
    return searched();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return searched();
  }

  find() async {
    return callback(query);
  }

  Widget searched() {
    return FutureBuilder(
        future: find(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return snapshot.data as Widget;
        });
  }
}
