// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimeAdapter extends TypeAdapter<Anime> {
  @override
  int get typeId=>0;
  @override
  Anime read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Anime(
      studio: fields[0] as String,
      genres: (fields[1] as List)?.cast<dynamic>(),
      hype: fields[2] as int,
      title: (fields[3] as String),
      startDate: fields[4] as String,
      description: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Anime obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.studio)
      ..writeByte(1)
      ..write(obj.genres)
      ..writeByte(2)
      ..write(obj.hype)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.startDate)
      ..writeByte(5)
      ..write(obj.description);
  }
}
