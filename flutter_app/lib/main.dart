import 'package:flutter/material.dart';
import 'router/router.dart' as router;
import 'router/routing_constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easter',
      onGenerateRoute: router.generateRoute,
      initialRoute: InputViewRoute,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        primaryColor: Colors.amber[800],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
