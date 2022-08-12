import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meow_app/models/random_fact.dart';
import 'package:meow_app/repository/random_facts_repository.dart';

import '../../services/api/networks/get_random.dart';

class CatPageCubit extends Cubit<CatPageState> {
  CatPageCubit() : super(CatPageLoadingState());

  void init() async {
    await getRandomFact();
  }

  RandomFact? randomFact;

  Future<void> getRandomFact() async {
    if (isClosed) return;
    emit(CatPageLoadingState());
    randomFact = (await GetRandom().getData()).data?.first;
    if (randomFact != null) {
      RandomFactsRepository().addCatFactToDb(randomFact!);
      if (isClosed) return;
      emit(CatPageReadyState(
        text: randomFact!.question,
        creationDate: randomFact!.createdAt,
      ));
    }
  }
}

abstract class CatPageState {}

class CatPageReadyState extends CatPageState {
  final String text;
  final DateTime creationDate;

  CatPageReadyState({
    required this.text,
    required this.creationDate,
  });
}

class CatPageLoadingState extends CatPageState {}
