import 'package:hive/hive.dart';

part 'anime.g.dart';

@HiveType()
class Anime {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String type;
  @HiveField(2)
  final int episodes;
  @HiveField(3)
  final String status;
  @HiveField(4)
  final String startDate;
  @HiveField(5)
  final String endDate;
  @HiveField(6)
  final String startingSeason;
  @HiveField(7)
  final String broadcastTime;
  @HiveField(8)
  final String producers;
  @HiveField(9)
  final String licenses;
  @HiveField(10)
  final String studios;
  @HiveField(11)
  final String sources;
  @HiveField(12)
  final String genres;
  @HiveField(13)
  final String duration;
  @HiveField(14)
  final String rating;
  @HiveField(15)
  final double score;
  @HiveField(16)
  final int scoredby;
  @HiveField(17)
  final int members;
  @HiveField(18)
  final int favourites;
  @HiveField(19)
  final String description;

  Anime(
      {this.title,
      this.type,
      this.episodes,
      this.status,
      this.startDate,
      this.endDate,
      this.startingSeason,
      this.broadcastTime,
      this.producers,
      this.licenses,
      this.studios,
      this.sources,
      this.genres,
      this.duration,
      this.rating,
      this.score,
      this.scoredby,
      this.members,
      this.favourites,
      this.description});
}
