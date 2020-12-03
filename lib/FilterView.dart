import 'package:flutter/material.dart';
import 'package:myfirstapp/ToDoList.dart';
import 'package:myfirstapp/model.dart';
import 'package:provider/provider.dart';

class AllTodosTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Consumer<MyState>(
            builder: (context, todo, child) => ToDoList(list: todo.allTodos)));
  }
}

class CompletedTodosTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<MyState>(
        builder: (context, todo, child) => ToDoList(
          list: todo.completedTodos,
        ),
      ),
    );
  }
}

class IncompleteTodosTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<MyState>(
        builder: (context, todo, child) => ToDoList(
          list: todo.incompleteTodos,
        ),
      ),
    );
  }
}
