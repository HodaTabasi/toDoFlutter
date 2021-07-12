import 'package:flutter/material.dart';
import 'package:flutter_app3/FirebaseAuth/FireBaseAuthHelper.dart';

class GetData extends StatefulWidget {
  @override
  _GetDataState createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {
              String id = FBHelper.fp.firebaseAuth.currentUser.uid;

            }, child: Text("get"))
          ],
        ),
      ),
    );
  }
}
