import 'package:flutter/material.dart';
import 'package:flutter_app3/todoApp/navigation/page3.dart';

class Page2 extends StatelessWidget {
  var name;

  var password;

  String myMessage = 'go to page 3';
  static final String routeName = 'page2';

  Page2(this.name, this.password, {this.myMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
        ),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
           var  gg = await Navigator.of(context)
                  .pushNamed(Page3.routeName,arguments: 'name');
              print(gg);
            },
            child: Text('go to page 2')),
      ),
    );
  }
}
