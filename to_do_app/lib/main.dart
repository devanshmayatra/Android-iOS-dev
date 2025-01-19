import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoApp(),
    ),
  );
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});
  @override
  State<StatefulWidget> createState() => TodoAppState();
}

class TodoAppState extends State<TodoApp> {
  List<String> todoItems = [];
  final _textController = TextEditingController();

  void _addTodoItem(String item) {
    setState(() {
      todoItems.add(item);
    });
    _textController.clear();
  }

  void _removeTodoItem(int index) {
    setState(() {
      todoItems.removeAt(index);
    });
  }

  void _showTodoDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add a new Item"),
          content: TextField(
            controller: _textController,
            decoration: const InputDecoration(
              labelText: "Enter a new item",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (_textController.text != "") {
                  _addTodoItem(_textController.text);
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please enter a task"),
                    ),
                  );
                }
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTodoItem(String todoText, int index) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      padding: const EdgeInsets.only(left: 10, top: 4, bottom: 4),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(child: Text(todoText)),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              _removeTodoItem(index);
            },
          ),
        ],
      ),
    );
    // return ListTile(
    //   title: Text(todoText),
    //   trailing: IconButton(
    //       icon: const Icon(Icons.delete),
    //       onPressed: () => _removeTodoItem(index)),
    // );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Todo List",
          style: TextStyle(
              fontSize: 24,
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: todoItems.isEmpty
          ? const Center(
              child: Text("No Todo Items"),
            )
          : ListView.builder(
              itemCount: todoItems.length,
              itemBuilder: (context, index) {
                return _buildTodoItem(todoItems[index], index);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showTodoDialog,
        tooltip: "Add a Task",
        child: const Icon(Icons.add),
      ),
    );
  }
}
