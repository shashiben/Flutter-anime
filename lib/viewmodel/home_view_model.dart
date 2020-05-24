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

  final String url =
      "https://raw.githubusercontent.com/shashiben/Flutter-todo/master/anime_data.json";

  getData() async {
    print("Entered get Data()");
    bool exists = await hiveService.isExists(boxName: "AnimeTable");
    if (exists) {
      setBusy(true);
      _animeList = await hiveService.getBoxes("AnimeTable");
      setBusy(false);
    } else {
      print("Getting data from Api");
      setBusy(true);
      var result = await apiService.fetchData(url: url);
      (result as List).map((e) {
        print("Titleas ate:" + e["title"]["text"].toString());
        Anime anime = Anime(
            genres: e["genres"],
            studio: e["studio"],
            startDate: e["startDate"],
            hype: e["hype"],
            description: e["description"],
            title: e["title"]["text"]);
        _animeList.add(anime);
      }).toList();
      await hiveService.addBoxes(_animeList, "AnimeTable");
      setBusy(false);
    }
  }
}
