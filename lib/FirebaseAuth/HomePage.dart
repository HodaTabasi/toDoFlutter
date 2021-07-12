import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'FireBaseAuthHelper.dart';

class HomePage extends StatefulWidget {
  String password;
  String newPassword;
  String oldPassword;
  User user;

  HomePage({this.password, this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String email = '';

  String password;

  bool isAccepted = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  sendForm() async {
    bool validationResult = formKey.currentState.validate();
    if (validationResult) {
      formKey.currentState.save();
      if (widget.password == widget.oldPassword) {
        FBHelper.fp.updatePassword(widget.newPassword);
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('error'),
                content: Text('someProblem'),
                actions: [
                  TextButton(
                      onPressed: () {
                        this.isAccepted = true;
                        setState(() {});
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return HomePage(
                            password: this.password,
                          );
                        }));
                      },
                      child: Text('Accept')),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancle')),
                ],
              );
            });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: TextFormField(
                validator: (v) {
                  if (v.length == 0 || v == null) {
                    return 'Required Field';
                  }
                },
                onSaved: (v) {
                  widget.oldPassword = v;
                },
                decoration: InputDecoration(
                    labelText: 'old password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: TextFormField(
                obscureText: true,
                validator: (v) {
                  if (v.length <= 6) {
                    return 'the password must be larger than 6 letters';
                  }
                },
                onSaved: (v) {
                  widget.newPassword = v;
                },
                decoration: InputDecoration(
                    labelText: 'new PASSWORD',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  sendForm();
                },
                child: Text('SEND'))
          ],
        ),
      ),
    );
  }
}
