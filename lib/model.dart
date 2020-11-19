import 'dart:collection';
import 'package:flutter/material.dart';

class MyTask {
  String text;
  bool completed;

  MyTask({this.text,
    this.completed = false,
  });

  void completedTask() {
    completed = !completed;
  }
}

class MyState extends ChangeNotifier {
  List<MyTask> _list = [];

  String filterSetting = 'All'; 

  List<MyTask> get list => _list;

  UnmodifiableListView<MyTask> get allTasks => 
      UnmodifiableListView(_list);

  UnmodifiableListView<MyTask> get incompleteTasks =>
             UnmodifiableListView(_list.where((task) => !task.completed));

  UnmodifiableListView<MyTask> get completedTasks =>
                 UnmodifiableListView(_list.where((task) => task.completed));

  void addItem(String text) {
    _list.add(MyTask(text: text));
    notifyListeners();
  }

  void removeItem(int index) {
    _list.removeAt(index);
    notifyListeners();
  }

  void changeState(MyTask task) {
    final taskIndex = _list.indexOf(task);
    _list[taskIndex].completedTask();
    notifyListeners();
  }

 /* void filterView(String filterSetting) {
    _list. 
    
     }
}*/
}