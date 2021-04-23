import 'package:flutter/material.dart';

class DetailsContainer extends StatelessWidget {
  final String text;
  final String field;

  DetailsContainer(this.text, {this.field = ''});

  final TextStyle _textStyle = const TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
    letterSpacing: 0.5,
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {
    final String textToUse =
        (this.field == '') ? this.text : '${this.field} : ${this.text}';

    return Container(
      margin: const EdgeInsets.fromLTRB(6, 6, 6, 20),
      child: Text(textToUse, style: _textStyle),
    );
  }
}
