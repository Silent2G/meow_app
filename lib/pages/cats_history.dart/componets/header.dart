import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
    return Container(
      color: Colors.blue,
      child: SizedBox(
        height: 80,
        child: Row(
          children: const [
            Expanded(
              child: Text(
                "Random fact",
                textAlign: TextAlign.center,
                style: style,
              ),
            ),
            Expanded(
              child: Text(
                "Creation date",
                textAlign: TextAlign.center,
                style: style,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
