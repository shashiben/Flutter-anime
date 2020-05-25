import 'package:flutter/material.dart';
import 'package:flutter_cache_with_hive/model/anime.dart';
import 'package:flutter_cache_with_hive/ui/home.dart';
import 'package:flutter_cache_with_hive/utils/appTheme.dart';
import 'package:flutter_cache_with_hive/utils/locator.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async{ 
  WidgetsFlutterBinding.ensureInitialized();
  final appDirectory=await  path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDirectory.path);
  Hive.registerAdapter(AnimeAdapter());
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Anime",
      theme: themeData(context),
      home: Home(),   
    );
  }
}