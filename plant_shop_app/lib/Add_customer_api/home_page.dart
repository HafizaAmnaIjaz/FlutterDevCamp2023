import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plant_shop_app/Add_customer_api/add_todo_page.dart';
import 'package:plant_shop_app/Add_customer_api/edit_todo_page.dart';
import 'package:plant_shop_app/Add_customer_api/model/todo.dart';

import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  Future<List<Todo>> fetchTodos() async {
    //const baseUrl = 'https://jsonplaceholder.typicode.com';
    const baseUrl = 'https://61e90df32f23920017b0ba83.mockapi.io';
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/todos'),
        headers: {
          HttpHeaders.contentTypeHeader: ContentType.json.toString(),
        },
      );

      ///  HttpStatus 200
      if (response.statusCode != HttpStatus.ok) {
        throw Exception('Failed to load todos');
      }
      final List todos = json.decode(response.body);
      return todos.map((todo) => Todo.fromMap(todo)).toList();
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<void> deleteTodo(String todoId) async {
    const baseUrl = 'https://61e90df32f23920017b0ba83.mockapi.io';
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/todos/$todoId'),
        headers: {
          HttpHeaders.contentTypeHeader: ContentType.json.toString(),
        },
      );

      ///  HttpStatus 200
      if (response.statusCode != HttpStatus.ok) {
        throw Exception('Failed to delete todo');
      }
      // final jsonData = json.decode(response.body);
      // return Todo.fromMap(jsonData);
    } catch (e) {
      throw Exception('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: const Text('All Customers'),
        backgroundColor: Colors.greenAccent,
        elevation: 0,
      ),
      body: FutureBuilder<List<Todo>>(
        future: fetchTodos(),
        builder: (context, snapshot) {
          final todos = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (todos == null) {
            return const Center(child: Text('No user found'));
          }

          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ListTile(
                hoverColor: Colors.white,
                leading: CircleAvatar(
                  child: Text(
                    todo.id!,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(
                  todo.task!,
                  style: TextStyle(color: Colors.white),
                ),
                // Text(
                //   todo.phoneno!,
                //   style: TextStyle(color: Colors.white),
                // ),

                subtitle: Text(
                  todo.createdAt!,
                  style: TextStyle(color: Colors.white),
                ),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => EditTodoPage(todo: todo),
                            ),
                          );
                          setState(() {
                            fetchTodos();
                          });
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            fetchTodos();
                          });
                          deleteTodo(todo.id!);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailPage(todo: todo),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddTodoPage(),
            ),
          );
          setState(() {
            fetchTodos();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
