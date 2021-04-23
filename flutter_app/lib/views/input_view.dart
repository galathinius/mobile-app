import 'package:flutter/material.dart';
import 'package:flutter_app/views/drawer/drawer.dart';
import '../router/routing_constants.dart';

class InputView extends StatefulWidget {
  @override
  _InputViewState createState() => _InputViewState();
}

class _InputViewState extends State<InputView> {
  String _text;

  void _setText(inputText) {
    _text = inputText;
  }

  void _pushShowText() {
    if (EasterRoutes.contains(_text)) {
      Navigator.pushNamed(context, _text);
    } else
      Navigator.pushNamed(context, TextViewRoute, arguments: _text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input page'),
      ),
      body: Center(
        child: Container(
          child: TextField(
            decoration: InputDecoration(
              // border: InputBorder.none,
              hintText: 'Enter a something',
            ),
            onChanged: (text) {
              _setText(text);
            },
          ),
          width: 250,
        ),
      ),
      drawer: DrawerWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: _pushShowText,
        tooltip: 'Done',
        child: Icon(Icons.check),
      ),
    );
  }
}
