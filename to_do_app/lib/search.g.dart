// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchAdapter extends TypeAdapter<Search> {
  @override
  final int typeId = 3;

  @override
  Search read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Search(
      title: fields[0] as String,
      noteid: fields[1] as String,
      note: fields[2] as Note,
    );
  }

  @override
  void write(BinaryWriter writer, Search obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.noteid)
      ..writeByte(2)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
