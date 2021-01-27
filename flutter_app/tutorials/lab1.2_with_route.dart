import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        primaryColor: Colors.amber[800],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'First lab'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _text;

  void _setText(inputText) {
    _text = inputText;
  }

  void _pushCounted() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondRoute(text: _text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
      floatingActionButton: FloatingActionButton(
        onPressed: _pushCounted,
        tooltip: 'Done',
        child: Icon(Icons.check),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  final String text;
  SecondRoute({Key key, this.text}) : super(key: key);

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
