import 'package:flutter/material.dart';
import 'tasklist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.purple,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  void _addtodo() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add Task'),
            content: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Enter Task'),
              ),
            ),
            actions: [
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  setState(() {
                    _controller.text = '';
                  });
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Add'),
                onPressed: () {
                  setState(() {
                    const TaskList()
                        .todo
                        .add({'title': _controller.text, 'isChecked': false});
                    _controller.text = '';
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do App'),
        centerTitle: true,
      ),
      body: const TaskList(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addtodo,
        label: const Text('Add Task'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
