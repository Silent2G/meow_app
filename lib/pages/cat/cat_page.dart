import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../components/color_button.dart';
import '../../constants.dart';
import '../cats_history.dart/cats_history_cubit.dart';
import '../cats_history.dart/cats_history_page.dart';
import 'cat_page_cubit.dart';

class CatPage extends StatelessWidget {
  const CatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final cubit = context.read<CatPageCubit>();
    return BlocBuilder<CatPageCubit, CatPageState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => BlocProvider(
                        create: (_) => CatsHistoryCubit()..init(),
                        child: const CatsHistoryPage(),
                      ),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Fact history',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        ),
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  key: UniqueKey(),
                  height: 350,
                  child: state is CatPageReadyState
                      ? Image.network(
                          key: UniqueKey(),
                          Constants.catImagePath,
                          fit: BoxFit.cover,
                        )
                      : SizedBox(
                          height: 350,
                          width: MediaQuery.of(context).size.width,
                          child: const CupertinoActivityIndicator(),
                        ),
                ),
                if (state is CatPageReadyState)
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Text(
                      state.text,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                if (state is CatPageReadyState)
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Text(
                      DateFormat.yMMMd(Platform.localeName)
                          .format(state.creationDate),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: ColorButton(
                    title: "Another fact!",
                    function: cubit.getRandomFact,
                    color: Colors.blue,
                  ),
                ))
          ],
        ),
      );
    });
  }
}
