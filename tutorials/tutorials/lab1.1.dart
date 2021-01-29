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
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _text;

  void _setText(inputText) {
    _text = inputText;
  }

  void _pushCounted() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (BuildContext context) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Input text'),
            ),
            body: Center(
              child: Text(
                '$_text',
                style: Theme.of(context).textTheme.headline4,
              ),
            ));
      }),
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
        tooltip: 'Increment',
        child: Icon(Icons.check),
      ),
    );
  }
}
