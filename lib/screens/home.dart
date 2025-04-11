import 'package:flutter/material.dart';
import 'package:todo/utils/todo_list.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List todos = [
    ['Daily Workout', false],
    ['NIDA Project', false],
    ['Plan the Day', false],
    ['Clean the House', false],
    ['Do Laundry', false],
    ['Go Shopping', false],
    ['Music Practice', false],
    ['Fix bugs', false],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade100,
      appBar: AppBar(
        title: const Text(
          'Todo',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, index) {
          return TodoList(
            taskName: todos[index][0],
            taskCompleted: todos[index][1],
            onChanged: (value) {
              todos[index][1] = value;
            },
          );
        },
      ),
    );
  }
}
