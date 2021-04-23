import 'package:http/http.dart' as http;
import 'dart:convert';
import 'bored_response.dart';

Future<Activity> fetchActivity() async {
  final response = await http.get(Uri.https('boredapi.com', 'api/activity/'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Activity.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load activity');
  }
}
