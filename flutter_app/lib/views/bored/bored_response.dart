class Activity {
  final String activity;
  final String type;
  final int participants;

  Activity({this.activity, this.type, this.participants});

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      activity: json['activity'],
      type: json['type'],
      participants: json['participants'],
    );
  }
}
