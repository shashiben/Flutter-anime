import 'package:flutter/material.dart';
import 'package:flutter_cache_with_hive/utils/appColors.dart';
import 'package:flutter_cache_with_hive/viewmodel/home_view_model.dart';
import 'package:flutter_cache_with_hive/widgets/anime_item.dart';
import 'package:flutter_cache_with_hive/widgets/loading_screen.dart';
import 'package:flutter_cache_with_hive/widgets/search_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String query = '';
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (model) => model.getData(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: backgroundColor,
                centerTitle: true,
                title: Text("AnimeList",
                    style: GoogleFonts.lato(color: Colors.white)),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () async {
                      final String selected = await showSearch(
                          context: context,
                          delegate: Search(anime: model.animeList));
                      if (selected != null && selected != query) {
                        setState(() {
                          query = selected;
                        });
                      }
                    },
                  )
                ],
              ),
              body: model.animeList.length != 0
                  ? Container(
                      color: backgroundColor,
                      padding: EdgeInsets.all(10),
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          itemCount: model.animeList.length,
                          itemBuilder: (context, index) {
                            return AnimeItem(
                              anime: model.animeList[index],
                            );
                          }),
                    )
                  : LoadingScreen(text: model.text,),
            ));
  }
}
