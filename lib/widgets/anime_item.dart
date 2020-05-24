import 'package:flutter/material.dart';
import 'package:flutter_cache_with_hive/model/anime.dart';
import 'package:flutter_cache_with_hive/ui/details.dart';
import 'package:flutter_cache_with_hive/utils/appColors.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimeItem extends StatelessWidget {
  final Anime anime;

  const AnimeItem({Key key, this.anime}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => AnimeDetails(anime: anime))),
      child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: primaryColor),
          child: Stack(children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: anime.title.length < 50
                  ? Text(
                      anime.title,
                      style:
                          GoogleFonts.cambo(color: Colors.white, fontSize: 20),
                    )
                  : Text(
                      anime.title,
                      style:
                          GoogleFonts.cambo(color: Colors.white, fontSize: 16),
                    ),
            ),
            Positioned(
                bottom: 10,
                right: 10,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.orangeAccent,
                    ),
                    Text(
                      anime.score.toString(),
                      style: TextStyle(color: Colors.orange),
                    ),
                  ],
                )),
            Positioned(
                bottom: 10,
                left: 10,
                child: anime.status == "Finished Airing"
                    ? Text(
                        "Completed",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      )
                    : Text("Airing",
                        style: TextStyle(fontSize: 10, color: Colors.white)))
          ])),
    );
  }
}
