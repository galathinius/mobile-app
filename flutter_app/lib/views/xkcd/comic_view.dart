import 'package:flutter/material.dart';
import 'dart:math';

import './comic_response.dart';
import './comic_request.dart';

class ComicView extends StatefulWidget {
  @override
  ComicViewState createState() => ComicViewState();
}

class ComicViewState extends State<ComicView> {
  Future<Comic> futureComic;

  final _random = new Random();
  int next() => 1 + _random.nextInt(2400 - 1);

  @override
  void initState() {
    super.initState();
    futureComic = fetchComic(next());
  }

  final TextStyle _titleStyle = const TextStyle(
    fontWeight: FontWeight.w800,
    fontFamily: 'Roboto',
    letterSpacing: 0.5,
    fontSize: 30,
  );
  final TextStyle _textStyle = const TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
    letterSpacing: 0.5,
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('xkcd comic'),
      ),
      body: Center(
        child: FutureBuilder<Comic>(
          future: futureComic,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: [
                  // title
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: Center(
                      child: Text(
                        snapshot.data.title,
                        style: _titleStyle,
                      ),
                    ),
                  ),

                  // image
                  Container(
                    margin: const EdgeInsets.all(6),
                    child: Image.network(snapshot.data.img),
                  ),

                  // details
                  Container(
                    margin: const EdgeInsets.fromLTRB(6, 6, 6, 20),
                    child: Text(snapshot.data.alt, style: _textStyle),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
