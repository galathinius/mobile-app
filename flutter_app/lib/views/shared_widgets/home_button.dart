import 'package:flutter/material.dart';

import '../../router/routing_constants.dart';

class HomeButton extends StatelessWidget {
  final context;

  HomeButton(this.context);

  void _goHome() {
    Navigator.pushNamed(context, InputViewRoute);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(icon: Icon(Icons.home_outlined), onPressed: _goHome);
  }
}
