
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meow_app/constants.dart';
import 'package:meow_app/models/random_fact.dart';

import '../models/random_facts_holder.dart';

class RandomFactsRepository {
  Future<List<RandomFact>> getAllCatFacts() async {
    final box = await Hive.openBox(Constants.boxKey);

    final RandomFactsHolder result = box.get(Constants.catFactsHolderKey,
        defaultValue: RandomFactsHolder([]));

    return result.catFacts;
  }

  Future<void> addCatFactToDb(RandomFact catFact) async {
    final box = await Hive.openBox(Constants.boxKey);
    final RandomFactsHolder holder = box.get(Constants.catFactsHolderKey,
        defaultValue: RandomFactsHolder([]));

    holder.catFacts.add(catFact);
    holder.save();
  }

  Future<RandomFact?> getCatFactById(int id) async {
    final box = await Hive.openBox(Constants.boxKey);
    final RandomFactsHolder holder = box.get(Constants.catFactsHolderKey);

    RandomFact? result;

    for (final RandomFact catFact in holder.catFacts) {
      if (catFact.id == id) {
        result = catFact;
      }
    }

    return result;
  }
}
