import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'models/random_fact.dart';
import 'models/random_facts_holder.dart';
import 'pages/cat/cat_page.dart';
import 'pages/cat/cat_page_cubit.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(RandomFactAdapter());
  Hive.registerAdapter(RandomFactsHolderAdapter());

  initializeDateFormatting(Platform.localeName);

  runApp(
    MaterialApp(
      home: BlocProvider(
        create: (_) => CatPageCubit()..init(),
        child: const CatPage(),
      ),
    ),
  );
}
