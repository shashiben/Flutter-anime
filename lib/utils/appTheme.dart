import 'package:flutter/material.dart';
import 'package:flutter_cache_with_hive/utils/appColors.dart';

final themeData = (BuildContext context) => ThemeData(
    primaryColor: primaryColor,
    primarySwatch: Colors.teal,
    textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
    iconTheme: IconThemeData(color: Colors.white));
