import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meow_app/models/random_fact.dart';

import '../../repository/random_facts_repository.dart';

class CatsHistoryCubit extends Cubit<CatsHistoryState> {
  CatsHistoryCubit() : super(CatsHistoryLoadingState());

  void init() async {
    List<RandomFact> list = await RandomFactsRepository().getAllCatFacts();
    if (isClosed) return;
    emit(CatsHistoryRedyState(facts: list));
  }
}

abstract class CatsHistoryState {}

class CatsHistoryRedyState extends CatsHistoryState {
  final List<RandomFact> facts;

  CatsHistoryRedyState({
    required this.facts,
  });
}

class CatsHistoryLoadingState extends CatsHistoryState {}
