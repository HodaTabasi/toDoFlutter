import 'package:flutter/material.dart';
import 'package:flutter_app3/todoApp/pages/add_task.dart';
import 'package:flutter_app3/todoApp/pages/all_tasks.dart';
import 'package:flutter_app3/todoApp/pages/complete_tasks.dart';
import 'package:flutter_app3/todoApp/pages/inComplete_tasks.dart';

import 'data/dummy_data.dart';
import 'models/task_model.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  deleteTask(Task task) {
    Data.tasks.remove(task);
    setState(() {});
  }

  updateTask(Task task) {
    task.isComplete = !task.isComplete;
    int index = Data.tasks.indexOf(task);
    Data.tasks[index] = task;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TODO APP'),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text('All Tasks'),
              ),
              Tab(
                child: Text('Complete Tasks'),
              ),
              Tab(
                child: Text('InComplete Tasks'),
              ),
            ],
          ),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () async {
                    var task = await Navigator.push(context, MaterialPageRoute(builder: (context){
                      return AddTask();
                    }
                    ));
                    setState(() {
                      Data.tasks.add(task);
                    });
                  },
                  child: Icon(
                    Icons.add_circle,
                    color: Colors.white,
                    size: 26.0,
                  ),
                )
            )
          ],
        ),
        body: TabBarView(children: [
          AllTasksPage(deleteTask, updateTask),
          CompleteTasksPage(deleteTask, updateTask),
          InCompleteTasksPage(deleteTask, updateTask)
        ]),
      ),
    );
  }
}
