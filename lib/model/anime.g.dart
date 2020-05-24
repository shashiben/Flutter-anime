// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimeAdapter extends TypeAdapter<Anime> {
  @override
  Anime read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Anime(
      title: fields[0] as String,
      type: fields[1] as String,
      episodes: fields[2] as int,
      status: fields[3] as String,
      startDate: fields[4] as String,
      endDate: fields[5] as String,
      startingSeason: fields[6] as String,
      broadcastTime: fields[7] as String,
      producers: fields[8] as String,
      licenses: fields[9] as String,
      studios: fields[10] as String,
      sources: fields[11] as String,
      genres: fields[12] as String,
      duration: fields[13] as String,
      rating: fields[14] as String,
      score: fields[15] as double,
      scoredby: fields[16] as int,
      members: fields[17] as int,
      favourites: fields[18] as int,
      description: fields[19] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Anime obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.episodes)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.startDate)
      ..writeByte(5)
      ..write(obj.endDate)
      ..writeByte(6)
      ..write(obj.startingSeason)
      ..writeByte(7)
      ..write(obj.broadcastTime)
      ..writeByte(8)
      ..write(obj.producers)
      ..writeByte(9)
      ..write(obj.licenses)
      ..writeByte(10)
      ..write(obj.studios)
      ..writeByte(11)
      ..write(obj.sources)
      ..writeByte(12)
      ..write(obj.genres)
      ..writeByte(13)
      ..write(obj.duration)
      ..writeByte(14)
      ..write(obj.rating)
      ..writeByte(15)
      ..write(obj.score)
      ..writeByte(16)
      ..write(obj.scoredby)
      ..writeByte(17)
      ..write(obj.members)
      ..writeByte(18)
      ..write(obj.favourites)
      ..writeByte(19)
      ..write(obj.description);
  }

  @override
  int get typeId=>0;
}
