import 'package:flutter/material.dart';

class SavedWordsView extends StatelessWidget {
  final Set<String> saved;
  SavedWordsView({Key key, this.saved}) : super(key: key);
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    final Iterable<ListTile> tiles = saved.map(
      (String pair) {
        return ListTile(
          title: Text(
            pair,
            style: _biggerFont,
          ),
        );
      },
    );
    final List<Widget> divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Suggestions'),
      ),
      body: ListView(children: divided),
    );
  }
}
