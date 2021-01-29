import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'routing_constants.dart';

import 'views/input_view.dart';
import 'views/text_view.dart';
import 'views/undefined_view.dart';

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
    default:
      return CupertinoPageRoute(
        builder: (context) => UndefinedView(
            // name: settings.name,
            ),
      );
  }
}
