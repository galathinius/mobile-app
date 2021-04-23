import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'routing_constants.dart';

import '../views/input_view.dart';
import '../views/text_view.dart';

import '../views/undefined_view.dart';

import '../views/words/words_view.dart';
import '../views/words/saved_view.dart';

import '../views/xkcd/comic_view.dart';
import '../views/bored/bored_view.dart';
import '../views/album/album_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case InputViewRoute:
      return CupertinoPageRoute(
        builder: (context) => InputView(),
      );
    case TextViewRoute:
      var textArgument = settings.arguments;
      return CupertinoPageRoute(
        builder: (context) => TextView(text: textArgument),
      );
    case WordsViewRoute:
      return MaterialPageRoute(
        builder: (context) => WordsView(),
      );
    case SavedWordsViewRoute:
      var listArguments = settings.arguments;
      return MaterialPageRoute(
        builder: (context) => SavedWordsView(saved: listArguments),
      );
    case ComicViewRoute:
      return MaterialPageRoute(
        builder: (context) => ComicView(),
      );
    case ActivityViewRoute:
      return MaterialPageRoute(
        builder: (context) => ActivityView(),
      );
    case AlbumViewRoute:
      return MaterialPageRoute(
        builder: (context) => AlbumView(),
      );
    default:
      return CupertinoPageRoute(
        builder: (context) => UndefinedView(),
      );
  }
}
