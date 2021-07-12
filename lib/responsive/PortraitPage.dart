import 'package:flutter/material.dart';

class Poratrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('port'),
      ),
      drawer: Drawer(
          child: ListView(children: <Widget>[
        ListTile(
          title: Text("Ttem 1"),
          trailing: Icon(Icons.arrow_forward),
        ),
        ListTile(
          title: Text("Item 2"),
          trailing: Icon(Icons.add_circle),
        ),
        ListTile(
          title: Text("Item 3"),
          trailing: Icon(Icons.ac_unit),
        )
      ])),
      body: Column(
        children: [Text("data")],
      ),
    );
  }
}
