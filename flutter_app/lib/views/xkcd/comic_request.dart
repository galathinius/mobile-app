import 'package:http/http.dart' as http;
import 'dart:convert';
import './comic_response.dart';

Future<Comic> fetchComic(int index) async {
  final response =
      await http.get(Uri.https('xkcd.com', '${index.toString()}/info.0.json'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Comic.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
