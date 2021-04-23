import 'package:flutter/material.dart';
import 'package:flutter_app/views/shared_widgets/home_button.dart';

import '../../routing_constants.dart';
import './words.dart';

class WordsView extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<WordsView> {
  final Set<String> _saved = Set<String>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);

  void _pushSaved() {
    Navigator.pushNamed(context, SavedWordsViewRoute, arguments: _saved);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: HomeButton(context),
        title: Text('Words page'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list_sharp), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildRow(String pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  Widget _buildSuggestions() {
    final Iterable<ListTile> tiles = suggestions.map(
      (String pair) {
        return _buildRow(pair);
      },
    );
    final List<Widget> divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();
    return ListView(children: divided);
  }
}
