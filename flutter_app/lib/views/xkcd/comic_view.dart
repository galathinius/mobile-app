import 'package:flutter/material.dart';
import 'dart:math';

import './comic_response.dart';
import './comic_request.dart';

import './widgets/image_container.dart';
import './widgets/title_container.dart';
import './widgets/details_container.dart';

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
                  TitleContainer(snapshot.data.title),

                  // image
                  ImageContainer(snapshot.data.img),

                  // details
                  DetailsContainer(snapshot.data.alt)
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
