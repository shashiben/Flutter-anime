import 'package:flutter/material.dart';
import 'package:flutter_cache_with_hive/ui/details.dart';
import 'package:flutter_cache_with_hive/utils/appColors.dart';
import 'package:flutter_cache_with_hive/viewmodel/home_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class Home extends StatelessWidget {
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
              ),
              body: Container(
                color: backgroundColor,
                padding: EdgeInsets.all(10),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemCount: model.animeList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>AnimeDetails(anime:model.animeList[index]))),
                        child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: primaryColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text(
                                  model.animeList[index].title,
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Icon(
                                        Icons.star,
                                        color: Colors.orangeAccent,
                                      ),
                                      Text(
                                        model.animeList[index].hype.toString(),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      
                                    ],
                                  ),
                                )
                              ],
                            )),
                      );
                    }),
              ),
            ));
  }
}
