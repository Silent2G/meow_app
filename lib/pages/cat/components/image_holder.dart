import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:meow_app/pages/cat/cat_page_cubit.dart';

class ImageHolder extends StatelessWidget {
  const ImageHolder({
    Key? key,
    required this.state,
  }) : super(key: key);

  final CatPageState state;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 350,
          width: MediaQuery.of(context).size.width,
          child: const CupertinoActivityIndicator(),
        ),
        if (state is CatPageReadyState)
          SizedBox(
            height: 350,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              fit: BoxFit.contain,
              "https://cataas.com/cat",
            ),
          ),
      ],
    );
  }
}
