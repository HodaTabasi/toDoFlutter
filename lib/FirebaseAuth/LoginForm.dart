import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/FireStore/MainDataPage.dart';
import 'package:flutter_app3/FirebaseAuth/FireBaseAuthHelper.dart';

import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
/*
1- replace textfield with textformfield
2- wrap all your textFotmFields with Form Widget
3- define validator and onsave for each textFormField
4- defile global key
5- assign the defined global key for the form
6- excute globalKey.currentState.validate()
7- excute globalKey.currentState.save()
*/

  String email = '';

  String password;

  bool isAccepted = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  sendForm() async {
    bool validationResult = formKey.currentState.validate();
    if (validationResult) {
      formKey.currentState.save();
      if (isAccepted) {
        // User user = await FBHelper.fp.regster(email, password);
        Map<String, dynamic> map = await FBHelper.fp.logIn(email, password);
        print(map);
        if (map.keys.contains('user')) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return MainDataPage(
              map.values.first,
              password
            );
          }));
        } else {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(map.keys.first),
                  content: Text(map.values.first),
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
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Warning'),
                content: Text(
                    'you have to accept our conditions before sending data'),
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
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
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
                  this.email = v;
                },
                decoration: InputDecoration(
                    labelText: 'EMAIL',
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
                  this.password = v;
                },
                decoration: InputDecoration(
                    labelText: 'PASSWORD',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            CheckboxListTile(
                title: Text('Accept'),
                value: isAccepted,
                onChanged: (v) {
                  this.isAccepted = v;
                  setState(() {});
                }),
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
