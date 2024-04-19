import 'dart:convert';

class Todo {
  
    int userId;
    int id;
    String title;
    bool completed;

    Todo({
        required this.userId,
        required this.id,
        required this.title,
        required this.completed,
    });

    factory Todo.fromRawJson(String str) => Todo.fromJson(json.decode(str));

    factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
    );
}