import 'package:flutter/material.dart';
import 'package:flutter_app3/LocalStorage/sp_helper.dart';

class AddDataToShared extends StatefulWidget {
  String state;

  AddDataToShared(this.state);

  @override
  _AddDataToSharedState createState() => _AddDataToSharedState();
}

class _AddDataToSharedState extends State<AddDataToShared> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String name = 'the name';
  String phone = 'the phone';
  String email = 'the email';

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add Data'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 130,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 0, bottom: 0),
              // padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'enter your name',
                    hintText: 'Enter value'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 0, bottom: 0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'enter your email',
                    hintText: 'Enter value'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 0, bottom: 0),
              child: TextField(
                controller: phoneController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'enter your phone',
                    hintText: 'Enter value'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                  onPressed: () {
                    print(nameController.text + " ffffff");
                    SPHelper.sp.insetStringData("name", nameController.text);
                    SPHelper.sp.insetStringData("email", emailController.text);
                    SPHelper.sp.insetStringData("phone", phoneController.text);
                  },
                  child: Text('Save data')),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      name = SPHelper.sp.getData("name");
                      email = SPHelper.sp.getData("email");
                      phone = SPHelper.sp.getData("phone");
                    });
                    print(name);
                  },
                  child: Text('get data')),
            ),
            Text(name),
            Text(email),
            Text(phone)
          ],
        ),
      ),
    );
    ;
  }
}
