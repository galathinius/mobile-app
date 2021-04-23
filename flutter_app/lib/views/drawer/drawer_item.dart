import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final String route;

  DrawerItem(this.title, this.route);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.title),
      onTap: () {
        // Update the state of the app
        Navigator.pushReplacementNamed(context, this.route);
      },
    );
  }
}
