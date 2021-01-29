import 'package:flutter/material.dart';
import 'router.dart' as router;
import 'routing_constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routing',
      onGenerateRoute: router.generateRoute,
      initialRoute: HomeViewRoute,
    );
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home'),
      ),
      floatingActionButton: onPressButton(context),
    );
  }

  FloatingActionButton onPressButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        // Navigate to LoginView and wait for a result to come back
        var result = await Navigator.pushNamed(
            context, LoginViewRoute); // If the result matches show a dialog
        if (result == 'fromLogin') {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('From Login'),
                  ));
        }
      },
      tooltip: 'Done',
      child: Icon(Icons.check),
    );
  }
}

class LoginView extends StatelessWidget {
  final String argument;
  const LoginView({Key key, this.argument}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, 'fromLogin');
        return false;
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context, 'fromLogin');
          },
        ),
        body: Center(
          child: Text('Login $argument'),
        ),
      ),
    );
  }
}
