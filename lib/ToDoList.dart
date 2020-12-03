import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class ToDoList extends StatefulWidget {
  final List<Todo> list;

  ToDoList({this.list});

  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) =>
          _item(context, widget.list[index], index),
      itemCount: widget.list.length,
    );
  }

  Widget _item(context, Todo todo, index) {
    return ListTile(
        title: Text(todo.title),
        leading: Checkbox(
          value: todo.completed,
          onChanged: (bool checked) {
            Provider.of<MyState>(context, listen: false)
                .changeState(todo, checked);
          },
        ),
        trailing: IconButton(
          onPressed: () {
            Provider.of<MyState>(context, listen: false).removeItem(todo);
          },
          icon: Icon(Icons.cancel),
        ));
  }
}
