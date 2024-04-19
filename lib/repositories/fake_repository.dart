import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:state_learning/repositories/todo_model.dart';

class FakeRepository {
  Future<String> fetchData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    final response = await http.get(url);

    final todoModel = Todo.fromJson(json.decode(response.body));

    return todoModel.title ?? 'nie maa';
  }
}