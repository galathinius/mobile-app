import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'routing_constants.dart';
import 'undefined_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeViewRoute:
      return CupertinoPageRoute(
        builder: (context) => HomeView(),
      );
    case LoginViewRoute:
      var loginArgument = settings.arguments;
      return CupertinoPageRoute(
        builder: (context) => LoginView(argument: loginArgument),
      );
    default:
      return CupertinoPageRoute(
        builder: (context) => UndefinedView(
          name: settings.name,
        ),
      );
  }
}
