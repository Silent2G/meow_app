import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'random_fact.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class RandomFact extends HiveObject {
  @JsonKey(name: "id")
  @HiveField(0)
  int id;

  @JsonKey(name: "question")
  @HiveField(1)
  String question;

  @JsonKey(name: "created_at")
  @HiveField(2)
  DateTime createdAt;

  RandomFact(this.id, this.question, this.createdAt);

  factory RandomFact.fromJson(Map<String, dynamic> json) =>
      _$RandomFactFromJson(json);

  Map<String, dynamic> toJson() => _$RandomFactToJson(this);

  @override
  String toString() {
    return 'RandomFact(id: $id, question: $question, createdAt: $createdAt)';
  }
}
