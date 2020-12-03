import 'package:flutter/material.dart';
import 'package:myfirstapp/FilterView.dart';
import 'package:myfirstapp/SecondView.dart';
import 'package:provider/provider.dart';
import 'model.dart';

void main() {
  var state = MyState();
  state.getTodos();

  runApp(ChangeNotifierProvider(
    create: (context) => state,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (Colors.grey),
        title: Text('TIG169 TODO',
            style: TextStyle(color: Colors.black, fontSize: 26)),
        actions: [
          PopupMenuButton(
              onSelected: (value) {
                Provider.of<MyState>(context, listen: false).setFilterBy(value);
              },
              itemBuilder: (context) => [
                    PopupMenuItem(child: Text('All'), value: 'All'),
                    PopupMenuItem(child: Text('Done'), value: 'Done'),
                    PopupMenuItem(child: Text('Undone'), value: 'Undone'),
                  ])
        ],
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) => _list(state.filterBy),
      ),
      floatingActionButton: _fab(context),
    );
  }

  Widget _list(filterBy) {
    if (filterBy == "All") return AllTodosTab();

    if (filterBy == "Done") return CompletedTodosTab();

    if (filterBy == "Undone") return IncompleteTodosTab();

    return null;
  }
}

Widget _fab(context) {
  return FloatingActionButton(
    child: Icon(Icons.add, size: 56),
    backgroundColor: Colors.grey,
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SecondView()));
    },
  );
}
