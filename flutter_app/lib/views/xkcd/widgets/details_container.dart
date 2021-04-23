import 'package:flutter/material.dart';

class DetailsContainer extends StatelessWidget {
  final String text;

  DetailsContainer(this.text);

  final TextStyle _textStyle = const TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
    letterSpacing: 0.5,
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(6, 6, 6, 20),
      child: Text(this.text, style: _textStyle),
    );
  }
}
