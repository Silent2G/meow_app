// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_fact.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RandomFactAdapter extends TypeAdapter<RandomFact> {
  @override
  final int typeId = 1;

  @override
  RandomFact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RandomFact(
      fields[0] as int,
      fields[1] as String,
      fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, RandomFact obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.question)
      ..writeByte(2)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RandomFactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RandomFact _$RandomFactFromJson(Map<String, dynamic> json) => RandomFact(
      json['id'] as int,
      json['question'] as String,
      DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$RandomFactToJson(RandomFact instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'created_at': instance.createdAt.toIso8601String(),
    };
