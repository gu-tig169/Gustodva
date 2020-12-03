import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:myfirstapp/api.dart';

class Todo {
  String title;
  bool completed;
  String id;

  Todo({
    this.title,
    this.completed = false,
    this.id,
  });

  static Map<String, dynamic> toJson(Todo todo) {
    return {
      "title": todo.title,
      "done": todo.completed,
      "id": todo.id,
    };
  }

  static Todo fromJson(Map<String, dynamic> json) {
    return Todo(title: json["title"], completed: json["done"], id: json["id"]);
  }

  void toggleCompleted() {
    if (completed == true) {
      completed = false;
    } else {
      completed = true;
    }
  }
}

class MyState extends ChangeNotifier {
  List<Todo> _list = [];

  String _filterBy = "All";

  List<Todo> get list => _list;

  String get filterBy => _filterBy;

  UnmodifiableListView<Todo> get allTodos => UnmodifiableListView(_list);
  UnmodifiableListView<Todo> get incompleteTodos =>
      UnmodifiableListView(_list.where((todo) => !todo.completed));
  UnmodifiableListView<Todo> get completedTodos =>
      UnmodifiableListView(_list.where((todo) => todo.completed));

  Future getTodos() async {
    List<Todo> list = await Api.getTodos();
    _list = list;
    notifyListeners();
  }

  void addItem(Todo todo) async {
    await Api.addTodo(todo);
    await getTodos();
    notifyListeners();
  }

  void removeItem(Todo todo) async {
    await Api.deleteTodos(todo.id);
    await getTodos();
  }

  void changeState(Todo todo, bool done) async {
    todo.completed = done;
    await Api.updateTodos(todo, todo.id);
    await getTodos();
  }

  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }
}
