import 'package:flutter/material.dart';
import 'package:flutter_app3/todoApp/navigation/page2.dart';

class Page1 extends StatefulWidget {
static final String routeName ='page1';
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
     Text txtName;
     Text txtPassword;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'title1',
        ),
      ),
      body: Column(
        children: [
          txtName = Text('my name is'),
          txtPassword = Text('my password'),
          ElevatedButton(
              onPressed: () {
                // Navigator.push(context,MaterialPageRoute(builder: (context){
                //
                // }));
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) {
                //   return Page2(txtName.data,txtPassword.data);
                // }));

                Navigator.of(context)
                    .pushNamed(Page2.routeName);
              },
              child: Text('go to page2')),
        ],
      ),
    );
  }
}
