import 'package:flutter/material.dart';
import 'package:flutter_app/views/shared_widgets/home_button.dart';
import 'dart:math';

import './comic_response.dart';
import './comic_request.dart';

import './widgets/image_container.dart';
import '../shared_widgets/title_container.dart';
import '../shared_widgets/details_container.dart';

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
        leading: HomeButton(context),
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
