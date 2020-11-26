import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myfirstapp/model.dart';

const API_URL = "https://todoapp-api-vldfm.ondigitalocean.app/";
const API_KEY = "4e2ee94b-d3ad-401d-a815-bf791c7d1f63";

class Api {
  static Future addTodo(Task task) async {
    print(task);
    var json = jsonEncode(Task.toJson(task));
    print(json);
    await http.post(
      "$API_URL/todos?key=$API_KEY",
      body: json,
      headers: {"Content-Type": "application/json"},
    );
    print("done");
  }

  static Future updateTodos(Task task) async {
    var json = jsonEncode(Task.toJson(task));
    await http.put("$API_URL/todos/id?key=$API_KEY", body: json);
  }

  static Future deleteTask(String taskID) async {
    await http.delete("$API_URL/todos/id?key=$API_KEY");
  }

  static Future<List<Task>> getTodos() async {
    var response = await http.get("$API_URL/todos?key=$API_KEY");
    String bodyString = response.body;
    print(response.body);
    List<Map<String, dynamic>> json = jsonDecode(bodyString);
    print(json);

    return json.map<Task>((data) {
      return Task.fromJson(data);
    }).toList();
  }
}