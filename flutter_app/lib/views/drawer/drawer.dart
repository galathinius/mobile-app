import 'package:flutter/material.dart';
import 'package:flutter_app/views/drawer/drawer_item.dart';

import '../../router/routing_constants.dart';

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
          DrawerItem('xkcd', ComicViewRoute),
          DrawerItem('words', WordsViewRoute),
          DrawerItem('album', AlbumViewRoute),
          DrawerItem('activity', ActivityViewRoute),
        ],
      ),
    );
  }
}
