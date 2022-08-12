import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import 'random_fact.dart';

part 'random_facts_holder.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class RandomFactsHolder extends HiveObject {
  @HiveField(0)
  List<RandomFact> catFacts;

  RandomFactsHolder(this.catFacts);

  factory RandomFactsHolder.fromJson(Map<String, dynamic> json) =>
      _$RandomFactsHolderFromJson(json);

  Map<String, dynamic> toJson() => _$RandomFactsHolderToJson(this);

  
}
