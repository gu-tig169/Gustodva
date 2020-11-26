import 'package:flutter/material.dart';
import 'package:myfirstapp/ToDoList.dart';
import 'package:myfirstapp/model.dart';
import 'package:provider/provider.dart';

class AllTasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Consumer<MyState>(
            builder: (context, task, child) => ToDoList(list: task.allTasks)));
  }
}

class CompletedTasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<MyState>(
        builder: (context, task, child) => ToDoList(
          list: task.completedTasks,
        ),
      ),
    );
  }
}

class IncompleteTasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<MyState>(
        builder: (context, task, child) => ToDoList(
          list: task.incompleteTasks,
        ),
      ),
    );
  }
}
