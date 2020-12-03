import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myfirstapp/model.dart';

const API_URL = "https://todoapp-api-vldfm.ondigitalocean.app";
const API_KEY = "76cc6ec9-b0f2-4417-9472-d39a5e49c409";

class Api {
  static Future addTodo(Todo todo) async {
    var json = jsonEncode(Todo.toJson(todo));
    print(json);
    await http.post(
      "$API_URL/todos?key=$API_KEY",
      body: json,
      headers: {"Content-Type": "application/json"},
    );
  }

  static Future updateTodos(Todo todo, String id) async {
    var json = jsonEncode(Todo.toJson(todo));
    print(json);
    await http.put("$API_URL/todos/$id?key=$API_KEY",
        body: json, headers: {"Content-Type": "application/json"});
  }

  static Future deleteTodos(String id) async {
    await http.delete("$API_URL/todos/$id?key=$API_KEY");
  }

  static Future<List<Todo>> getTodos() async {
    var response = await http.get("$API_URL/todos?key=$API_KEY");
    print(response.body);
    var json = jsonDecode(response.body);
    return json.map<Todo>((data) {
      return Todo.fromJson(data);
    }).toList();
  }
}
