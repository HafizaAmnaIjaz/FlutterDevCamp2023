import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model/todo.dart';

class EditTodoPage extends StatefulWidget {
  const EditTodoPage({
    Key? key,
    required this.todo,
  }) : super(key: key);

  final Todo? todo;

  @override
  _AddTodoPageState createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<EditTodoPage> {
  final _taskController = TextEditingController();

  Future<Todo> updateTodo(Todo todo) async {
    const baseUrl = 'https://61e90df32f23920017b0ba83.mockapi.io';
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/todos/${widget.todo!.id}'),
        headers: {
          HttpHeaders.contentTypeHeader: ContentType.json.toString(),
        },
        body: json.encode(
          Todo(
            task: todo.task,
            createdAt: todo.createdAt,
          ).toMap(),
        ),
      );

      ///  HttpStatus 200
      if (response.statusCode != HttpStatus.ok) {
        throw Exception('Failed to update todo');
      }
      final jsonData = json.decode(response.body);
      return Todo.fromMap(jsonData);
    } catch (e) {
      throw Exception('$e');
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.todo != null) {
      _taskController.text = widget.todo!.task!;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _taskController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: _taskController,
            decoration: const InputDecoration(
              labelText: 'Task',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (widget.todo != null) {
                updateTodo(
                  Todo(
                    task: _taskController.text.trim(),
                    createdAt: DateTime.now().toIso8601String(),
                  ),
                );
                Navigator.pop(context);
              }
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }
}
