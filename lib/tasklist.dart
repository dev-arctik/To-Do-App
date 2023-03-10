import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();

  List<Map<String, dynamic>> get todo => _TaskListState.todo;
}

class _TaskListState extends State<TaskList> {
  // List to contain todo. title will store the content and isChecked will check if task is complete or not.
  static List<Map<String, dynamic>> todo = [
    {'title': 'Enter A Task', 'isChecked': false},
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        itemCount: todo.length,
        itemBuilder: (BuildContext context, int index) {
          final todoitems = todo[index];
          return Card(
            child: ListTile(
              //Checkbox
              leading: Checkbox(
                  value: todoitems['isChecked'],
                  onChanged: (bool? newValue) {
                    setState(() {
                      todoitems['isChecked'] = newValue;
                    });
                  }),

              // Task content
              title: Text(
                todoitems['title'],
                style: TextStyle(
                    decoration: todoitems['isChecked']
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),

              // Delete icon
              trailing: IconButton(
                icon: const Icon(Icons.delete_forever_rounded),
                onPressed: () {
                  setState(() {
                    todo.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
