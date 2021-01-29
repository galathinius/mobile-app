import 'package:flutter/material.dart';
import 'router.dart' as router;
import 'routing_constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 1',
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
