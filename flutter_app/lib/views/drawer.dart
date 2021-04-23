import 'package:flutter/material.dart';

import '../routing_constants.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Some pages'),
            decoration: BoxDecoration(
              color: Colors.amber[700],
            ),
          ),
          ListTile(
            title: Text('xkcd'),
            onTap: () {
              // Update the state of the app
              Navigator.pushReplacementNamed(context, ComicViewRoute);
            },
          ),
          ListTile(
            title: Text('words'),
            onTap: () {
              // Update the state of the app
              Navigator.pushReplacementNamed(context, WordsViewRoute);
            },
          ),
        ],
      ),
    );
  }
}
