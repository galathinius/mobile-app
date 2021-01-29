import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final String text;
  TextView({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input text'),
      ),
      body: Center(
        child: Text(
          '$text',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
