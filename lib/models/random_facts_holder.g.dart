// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_facts_holder.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RandomFactsHolderAdapter extends TypeAdapter<RandomFactsHolder> {
  @override
  final int typeId = 2;

  @override
  RandomFactsHolder read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RandomFactsHolder(
      (fields[0] as List).cast<RandomFact>(),
    );
  }

  @override
  void write(BinaryWriter writer, RandomFactsHolder obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.catFacts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RandomFactsHolderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RandomFactsHolder _$RandomFactsHolderFromJson(Map<String, dynamic> json) =>
    RandomFactsHolder(
      (json['catFacts'] as List<dynamic>)
          .map((e) => RandomFact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RandomFactsHolderToJson(RandomFactsHolder instance) =>
    <String, dynamic>{
      'catFacts': instance.catFacts,
    };
