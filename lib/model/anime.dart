import 'package:hive/hive.dart';

part 'anime.g.dart';
@HiveType()
class Anime{
  @HiveField(0)
  final String studio;
  @HiveField(1)
  final List genres;
  @HiveField(2)
  final int hype;
  @HiveField(3)
  final String title;
  @HiveField(4)
  final String startDate;
  @HiveField(5)
  final String description;

  Anime({this.studio, this.genres, this.hype, this.title, this.startDate,this.description});
}
