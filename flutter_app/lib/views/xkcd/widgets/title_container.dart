import 'package:flutter/material.dart';

class TitleContainer extends StatelessWidget {
  final String title;

  TitleContainer(this.title);

  final TextStyle _titleStyle = const TextStyle(
    fontWeight: FontWeight.w800,
    fontFamily: 'Roboto',
    letterSpacing: 0.5,
    fontSize: 30,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: Center(
        child: Text(
          this.title,
          style: _titleStyle,
        ),
      ),
    );
  }
}
