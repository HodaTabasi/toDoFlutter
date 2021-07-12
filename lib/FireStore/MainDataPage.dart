import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/FireStore/FireBaseStoreHelper.dart';
import 'package:flutter_app3/FireStore/model/User.dart';
import 'package:flutter_app3/FirebaseAuth/HomePage.dart';

import 'GetData.dart';

class MainDataPage extends StatefulWidget {
  User user;
  String password;

  MainDataPage(this.user, this.password);

  @override
  _MainDataPageState createState() => _MainDataPageState();
}

class _MainDataPageState extends State<MainDataPage> {
  String fname;
  String lname;
  String age;
  String city;
  String mobile;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void sendForm() async {
    bool validationResult = formKey.currentState.validate();
    if (validationResult)  {
      formKey.currentState.save();
      UserModel model = UserModel.allData(
          Id: widget.user.uid,
          fname: fname,
          lname: lname,
          age: age,
          city: city,
          mobile: mobile,
          email: widget.user.email,
          password: widget.password);
      bool boo = await FBHelper.fp.addUser(model);

      if(boo){

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
              return GetData();
            }));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('fireStore'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: TextFormField(
                  obscureText: false,
                  validator: (v) {},
                  onSaved: (v) {
                    this.fname = v;
                  },
                  decoration: InputDecoration(
                      labelText: 'First Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: TextFormField(
                  obscureText: false,
                  validator: (v) {},
                  onSaved: (v) {
                    this.lname = v;
                  },
                  decoration: InputDecoration(
                      labelText: 'Last Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: TextFormField(
                  obscureText: false,
                  validator: (v) {},
                  onSaved: (v) {
                    this.age = v;
                  },
                  decoration: InputDecoration(
                      labelText: 'Age',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: TextFormField(
                  obscureText: false,
                  validator: (v) {},
                  onSaved: (v) {
                    this.city = v;
                  },
                  decoration: InputDecoration(
                      labelText: 'City',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: TextFormField(
                  obscureText: false,
                  validator: (v) {},
                  onSaved: (v) {
                    this.mobile = v;
                  },
                  decoration: InputDecoration(
                      labelText: 'mobile',
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
      ),
    );
  }
}
