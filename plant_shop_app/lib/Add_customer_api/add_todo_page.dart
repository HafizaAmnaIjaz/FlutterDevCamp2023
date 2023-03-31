import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model/todo.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  _AddTodoPageState createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final _taskController = TextEditingController();
  final _phoneController = TextEditingController();
  Future<Todo> createTodo(Todo todo) async {
    const baseUrl = 'https://61e90df32f23920017b0ba83.mockapi.io';
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/todos'),
        headers: {
          HttpHeaders.contentTypeHeader: ContentType.json.toString(),
        },
        body: json.encode(
          Todo(
            task: todo.task,
            createdAt: todo.createdAt,
            phoneno: todo.phoneno,
          ).toMap(),
        ),
      );

      ///  HttpStatus 201
      if (response.statusCode != HttpStatus.created) {
        throw Exception('Failed to create todo');
      }
      final jsonData = json.decode(response.body);
      return Todo.fromMap(jsonData);
    } catch (e) {
      throw Exception('$e');
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
        backgroundColor: Colors.greenAccent,
        body: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _taskController,
                decoration: const InputDecoration(
                  labelText: 'Customer name',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone#',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  createTodo(
                    Todo(
                      task: _taskController.text.trim(),
                      createdAt: DateTime.now().toIso8601String(),
                      phoneno: _phoneController.text.toString(),
                    ),
                  );
                  Navigator.pop(context);
                },
                child: const Text('Send Order'),
              ),
            ],
          ),
        ));
  }
}

RaisedButton({required Null Function() onPressed, required Text child}) {}
