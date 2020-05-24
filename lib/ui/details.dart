import 'package:flutter/material.dart';
import 'package:flutter_cache_with_hive/model/anime.dart';
import 'package:flutter_cache_with_hive/utils/appColors.dart';
import 'package:flutter_cache_with_hive/widgets/details_row_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimeDetails extends StatelessWidget {
  final Anime anime;

  const AnimeDetails({Key key, this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        centerTitle: true,
        title: Text(
          anime.title,
          style: GoogleFonts.lato(),
        ),
        backgroundColor: backgroundColor.withOpacity(0.6),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        color: backgroundColor,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: CircleAvatar(
                    backgroundColor: Colors.orangeAccent,
                    radius: 40,
                    child: Center(
                        child: Text(
                      anime.title.substring(0, 1),
                      style: GoogleFonts.lexendDeca(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        anime.title,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                        style: GoogleFonts.lobster(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      Text(
                        anime.type,
                        style: GoogleFonts.lato(
                            color: Colors.white.withOpacity(0.6)),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text("Description:",
                style: GoogleFonts.quicksand(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            SizedBox(
              height: 5,
            ),
            Text(
              anime.description,
              style: GoogleFonts.lato(color: Colors.white.withOpacity(0.6)),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Details:",
                style: GoogleFonts.quicksand(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            DetailsRow(
                heading: "BroadcastTime",
                details: anime.broadcastTime.toString()),
            DetailsRow(heading: "Episodes", details: anime.episodes.toString()),
            DetailsRow(heading: "Status", details: anime.status.toString()),
            DetailsRow(
                heading: "Start airing", details: anime.startDate.toString()),
            DetailsRow(
                heading: "End airing", details: anime.endDate.toString()),
            DetailsRow(
                heading: "Starting season",
                details: anime.startingSeason.toString()),
            DetailsRow(
                heading: "Producers", details: anime.producers.toString()),
            DetailsRow(
                heading: "Licensors", details: anime.licenses.toString()),
            DetailsRow(heading: "Studios", details: anime.studios.toString()),
            DetailsRow(heading: "Sources", details: anime.sources.toString()),
            DetailsRow(heading: "Genres", details: anime.genres.toString()),
            DetailsRow(heading: "Duration", details: anime.duration.toString()),
            DetailsRow(heading: "Rating", details: anime.rating.toString()),
            DetailsRow(heading: "Score", details: anime.score.toString()),
            DetailsRow(
                heading: "Scored by", details: anime.scoredby.toString()),
            DetailsRow(heading: "Members", details: anime.members.toString()),
            DetailsRow(
                heading: "Favorites", details: anime.favourites.toString()),
          ],
        )),
      ),
    );
  }
}
