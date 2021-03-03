import 'package:flutter/material.dart';

import '../../routing_constants.dart';

class WordsView extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<WordsView> {
  final Set<String> _saved = Set<String>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);

  void _pushSaved() {
    Navigator.pushNamed(context, SavedViewRoute, arguments: _saved);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
    final Iterable<ListTile> tiles = _suggestions.map(
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

  final List<String> _suggestions = [
    "communication",
    "population",
    "engineering",
    "distribution",
    "development",
    "contribution",
    "analysis",
    "understanding",
    "satisfaction",
    "technology",
    "recommendation",
    "responsibility",
    "imagination",
    "advertising",
    "obligation",
    "opportunity",
    "resolution",
    "interaction",
    "university",
    "philosophy",
    "explanation",
    "revolution",
    "literature",
    "investment",
    "recording",
    "information",
    "intention",
    "enthusiasm",
    "application",
    "establishment",
  ];
}
