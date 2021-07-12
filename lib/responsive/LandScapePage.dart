import 'package:flutter/material.dart';

class LandSacpe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('port'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
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
            ]),
          ),
          Expanded(flex: 2, child: Text("data"))
        ],
      ),
    );
  }
}
