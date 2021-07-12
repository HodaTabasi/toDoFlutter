import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/FirebaseAuth/LoginForm.dart';
import 'package:flutter_app3/todoApp/Constent/Contest.dart';
import 'package:flutter_app3/todoApp/main_page.dart';
import 'package:flutter_app3/todoApp/navigation/page1.dart';
import 'package:flutter_app3/todoApp/navigation/page2.dart';
import 'package:flutter_app3/todoApp/navigation/page3.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    home: App(),
  ));
}

/// We are using a StatefulWidget such that we only create the [Future] once,
/// no matter how many times our widget rebuild.
/// If we used a [StatelessWidget], in the event where [App] is rebuilt, that
/// would re-initialize FlutterFire and make our application re-enter loading state,
/// which is undesired.
class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text("error")),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            body: LoginPage(),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Scaffold(
          body: Center(child: Text("loading")),
        );

      },
    );
  }
}
