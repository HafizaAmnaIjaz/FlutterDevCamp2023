import 'package:flutter/material.dart';

import 'model/todo.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.todo,
  }) : super(key: key);
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Text('Id: ${user.id}'),
          // Text('Name:${user.name}'),
          // Text('Phone: ${user.phone}'),
          // Text('${user.username}'),
          // Text('${user.website}'),
          // Text('${user.company?.name}'),
          // Text('${user.company?.catchPhrase}'),
          // Text('${user.company?.bs}'),
          // Text('${user.address?.street}'),
          // Text('${user.address?.city}'),
          // Text('${user.address?.zipcode}'),
          // Text('${user.address?.suite}'),
          // Text('${user.address?.geo?.lat}'),
          // Text('${user.address?.geo?.lng}'),
          Text('ID: ${todo.id}'),
          Text('Task: ${todo.task}'),
          Text('Created Date: ${todo.createdAt}'),
        ],
      ),
    );
  }
}
