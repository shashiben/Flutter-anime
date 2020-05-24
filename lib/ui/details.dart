import 'package:flutter/material.dart';
import 'package:flutter_cache_with_hive/model/anime.dart';
import 'package:flutter_cache_with_hive/utils/appColors.dart';

class AnimeDetails extends StatelessWidget {
  final Anime anime;

  const AnimeDetails({Key key, this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(anime.description.toString());
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        centerTitle: true,
        title: Text(anime.title),
        backgroundColor: backgroundColor.withOpacity(0.6),
      ),
      body: Container(
        color: backgroundColor.withOpacity(0.6),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(15)),
            height: MediaQuery.of(context).size.height / 2 + 120,
            width: MediaQuery.of(context).size.width - 100,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text(
                        anime.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Description:",
                      style: TextStyle(color: Colors.white),
                    ),
                    Wrap(
                      children: <Widget>[
                        Text(
                          anime.description.toString(),
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Start date:" + anime.startDate,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Genres:",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    anime.genres.length != 0
                        ? Wrap(
                            children: <Widget>[
                              for (int i = 0; i < anime.genres.length; i++)
                                Text(
                                  anime.genres[i] + ",",
                                  style: TextStyle(color: Colors.white),
                                )
                            ],
                          )
                        : Text(
                            "Not mentioned",
                            style: TextStyle(color: Colors.white),
                          ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Studio:",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    anime.studio.length != 0
                        ? Wrap(
                            children: <Widget>[
                              for (int i = 0; i < anime.studio.length; i++)
                                Text(
                                  anime.studio[i] + ",",
                                  style: TextStyle(color: Colors.white),
                                )
                            ],
                          )
                        : Text(
                            "Not mentioned",
                            style: TextStyle(color: Colors.white),
                          )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
