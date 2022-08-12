import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meow_app/pages/cats_history.dart/cats_history_cubit.dart';

import 'componets/header.dart';
import 'componets/history_item.dart';

class CatsHistoryPage extends StatelessWidget {
  const CatsHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatsHistoryCubit, CatsHistoryState>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Header(),
          automaticallyImplyLeading: false,
        ),
        body: state is CatsHistoryRedyState
            ? Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: state.facts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return HistoryItem(fact: state.facts[index]);
                        }),
                  )
                ],
              )
            : const CupertinoActivityIndicator(),
      );
    });
  }
}
