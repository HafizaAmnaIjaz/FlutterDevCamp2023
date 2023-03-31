// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Todo {
  final String? createdAt;
  final String? task;
  final String? id;
  final String? phoneno;
  Todo({
    this.createdAt,
    this.task,
    this.id,
    this.phoneno,
  });

  Todo copyWith({
    String? createdAt,
    String? task,
    String? id,
    String? phoneno,
  }) {
    return Todo(
      createdAt: createdAt ?? this.createdAt,
      task: task ?? this.task,
      id: id ?? this.id,
      phoneno: phoneno ?? this.phoneno,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'createdAt': createdAt,
      'task': task,
      'id': id,
      'phoneno': phoneno,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      task: map['task'] != null ? map['task'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
      phoneno: map['phoneno'] != null ? map['phoneno'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) =>
      Todo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Todo(createdAt: $createdAt, task: $task, id: $id, phoneno: $phoneno)';
  }

  @override
  bool operator ==(covariant Todo other) {
    if (identical(this, other)) return true;

    return other.createdAt == createdAt &&
        other.task == task &&
        other.id == id &&
        other.phoneno == phoneno;
  }

  @override
  int get hashCode {
    return createdAt.hashCode ^ task.hashCode ^ id.hashCode ^ phoneno.hashCode;
  }
}
