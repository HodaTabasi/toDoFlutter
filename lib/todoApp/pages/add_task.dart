import 'package:flutter/material.dart';
import 'package:flutter_app3/todoApp/models/task_model.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add Task'),
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
                controller: myController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'enter your task',
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
                    Task task = Task(myController.text, false);
                    Navigator.of(context).pop(task);
                  },
                  child: Text('Save Task')),
            ),
          ],
        ),
      ),
    );
  }
}
