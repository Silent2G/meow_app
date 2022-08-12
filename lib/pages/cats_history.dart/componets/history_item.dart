import 'dart:io';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../../../models/random_fact.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    Key? key,
    required this.fact,
  }) : super(key: key);

  final RandomFact fact;

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
    );

    return Padding(
      padding: const EdgeInsets.only(top: 1),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  fact.question,
                  style: style,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  DateFormat.yMMMd(Platform.localeName).format(fact.createdAt),
                  style: style,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
