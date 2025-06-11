import 'package:flutter/material.dart';
import 'package:todo/utils/todo_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  List todos = [
    ['Daily Workout', false],
    ['Flutter Project', false],
    ['Plan the Day', false],
    ['Clean the House', false],
    ['Do Laundry', false],
    ['Go Shopping', false],
    ['Music Practice', false],
    ['Fix bugs', false],
  ];

  void checkBoxChanged(int index) {
    setState(() {
      todos[index][1] = !todos[index][1];
    });
  }

  void addTask(String task) {
    setState(() {
      todos.add([task, false]);
    });
  }

  void deleteTask(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

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
            onChanged: (value) => checkBoxChanged(index),
          );
        },
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 10),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Add a new task',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                addTask(_controller.text);
                _controller.clear();
              }
            },
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
