import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  static final String routeName ='page3';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'title3',
          ),
        ),
        body: Center(
          child: ElevatedButton(onPressed: () {
            Navigator.of(context).pop('hello from page3');
          }, child: Text('go to page3')),
        ),
      ),
    );
  }
}
