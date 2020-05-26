import 'package:flutter_cache_with_hive/model/anime.dart';
import 'package:flutter_cache_with_hive/services/api_service.dart';
import 'package:flutter_cache_with_hive/services/hive_service.dart';
import 'package:flutter_cache_with_hive/utils/locator.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final HiveService hiveService = locator<HiveService>();
  final APIService apiService = locator<APIService>();

  List<dynamic> _animeList = [];
  List<dynamic> get animeList => _animeList;
  String _text="";
  String get text=>_text;

  final String url =
      "https://raw.githubusercontent.com/shashiben/Flutter_cache_with_hive/master/csvjson.json";

  getData() async {
    print("Entered get Data()");
    _text="Fetching data";
    bool exists = await hiveService.isExists(boxName: "AnimeTable");
    if (exists) {
      _text="Fetching from hive";
      print("Getting data from Hive");
      setBusy(true);
      _animeList = await hiveService.getBoxes("AnimeTable");
      setBusy(false);
    } else {
      _text="Fetching from hive";
      print("Getting data from Api");
      setBusy(true);
      var result = await apiService.fetchData(url: url);
      (result as List).map((e) {
        Anime anime = Anime(
            title: e["Title"],
            type: e["Type"],
            episodes: e["Episodes"],
            status: e["Status"],
            startDate: e["Start airing"],
            endDate: e["End airing"],
            startingSeason: e["Starting season"],
            broadcastTime: e["Broadcast time"],
            producers: e["Producers"],
            licenses: e["Licensors"],
            studios: e["Studios"],
            sources: e["Sources"],
            genres: e["Genres"],
            duration: e["Duration"],
            rating: e["Rating"],
            score: e["Score"].toDouble(),
            scoredby: e["Scored by"],
            members: e["Members"],
            favourites: e["Favourites"],
            description: e["Description"]);
        _animeList.add(anime);
      }).toList();
      _text="Caching data";
      await hiveService.addBoxes(_animeList, "AnimeTable");
      setBusy(false);
    }
  }
}
