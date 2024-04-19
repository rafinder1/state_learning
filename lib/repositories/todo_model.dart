import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';


@freezed
class Todo with _$Todo {
  const factory Todo({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}

// class Todo {
  
//     int userId;
//     int id;
//     String title;
//     bool completed;

//     Todo({
//         required this.userId,
//         required this.id,
//         required this.title,
//         required this.completed,
//     });

//     factory Todo.fromRawJson(String str) => Todo.fromJson(json.decode(str));

//     factory Todo.fromJson(Map<String, dynamic> json) => Todo(
//         userId: json["userId"],
//         id: json["id"],
//         title: json["title"],
//         completed: json["completed"],
//     );
// }

// class Todo {
  
//     int userId;
//     int id;
//     String title;
//     bool completed;

//     Todo({
//         required this.userId,
//         required this.id,
//         required this.title,
//         required this.completed,
//     });

//     factory Todo.fromRawJson(String str) => Todo.fromJson(json.decode(str));

//     factory Todo.fromJson(Map<String, dynamic> json) => Todo(
//         userId: json["userId"],
//         id: json["id"],
//         title: json["title"],
//         completed: json["completed"],
//     );
// }