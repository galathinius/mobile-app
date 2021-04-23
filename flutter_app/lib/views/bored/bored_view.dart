import 'package:flutter/material.dart';

import 'bored_response.dart';
import 'bored_request.dart';

import '../shared_widgets/title_container.dart';
import '../shared_widgets/details_container.dart';

class ActivityView extends StatefulWidget {
  @override
  ActivityViewState createState() => ActivityViewState();
}

class ActivityViewState extends State<ActivityView> {
  Future<Activity> futureActivity;

  @override
  void initState() {
    super.initState();
    futureActivity = fetchActivity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity'),
      ),
      body: Center(
        child: FutureBuilder<Activity>(
          future: futureActivity,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: [
                  // title
                  TitleContainer(snapshot.data.activity),

                  // details
                  DetailsContainer(
                    snapshot.data.type,
                    field: 'type',
                  ),

                  // details
                  DetailsContainer(
                    snapshot.data.participants.toString(),
                    field: 'participants',
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
