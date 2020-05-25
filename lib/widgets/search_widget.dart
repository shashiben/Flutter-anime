import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_cache_with_hive/ui/details.dart';
import 'package:flutter_cache_with_hive/utils/appColors.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends SearchDelegate<String> {
  final List<dynamic> anime;

  Search({this.anime});
  List<dynamic> filterSearch = [];
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        tooltip: 'Clear',
        icon: const Icon((Icons.clear)),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var _history = [];
    for (int i = 0; i <= 5; i++) {
      int i = Random().nextInt(anime.length);
      _history.add(anime[i].title);
    }
    List<String> strList = [];
    for (var i in anime) {
      strList.add(i.title.toString());
    }
    final suggestions = query.isEmpty
        ? _history
        : strList
            .where((element) =>
                element.toLowerCase().contains(query.toLowerCase()))
            .toList();
    return Container(
      color: backgroundColor,
      child: ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (BuildContext context, int index) {
            return new ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Text(
                      suggestions[index].toString().substring(0, 1),
                      style: GoogleFonts.lobster(color: Colors.white),
                    )),
              ),
              title: Text(
                suggestions[index],
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AnimeDetails(
                              anime: returnAnime(suggestions[index]),
                            )));
              },
            );
          }),
    );
  }

  returnAnime(String title) {
    for (var i in anime) {
      if (i.title == title) {
        return i;
      }
    }
  }
}
