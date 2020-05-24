// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_cache_with_hive/services/api_service.dart';
import 'package:flutter_cache_with_hive/services/hive_service.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerLazySingleton<HiveService>(() => HiveService());
  g.registerLazySingleton<APIService>(() => APIService());
}
