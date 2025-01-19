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
  List<Map> contacts = [];
  void _addTodoItem(String name, String number, String email) {
    Map<String, dynamic> contact = {
      'name': name,
      'number': number,
      'email': email
    };
    setState(() {
      contacts.add(contact);
    });
    nameTextController.clear();
    numberTextController.clear();
    emailTextController.clear();
  }

  void _removeTodoItem(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  Widget _buildTodoItem(Map contact, int index) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      padding: const EdgeInsets.only(left: 10, top: 4, bottom: 4),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(child: Text(contact["name"])),
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

  void _showFullScreenDialog(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => const FullScreenDialog(),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "contacts",
          style: TextStyle(
              fontSize: 24,
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => _showFullScreenDialog(context),
                child: const Icon(Icons.add),
              )
            ],
          ),
          contacts.isEmpty
              ? const Center(
                  child: Text("No contacts"),
                )
              : ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    return _buildTodoItem(contacts[index], index);
                  },
                ),
        ],
      ),
    );
  }
}

class FullScreenDialog extends StatelessWidget {
  FullScreenDialog({super.key});

  final _nameTextController = TextEditingController();
  final _numberTextController = TextEditingController();
  final _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add COntact"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 16),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: _nameTextController,
                  decoration: const InputDecoration(
                    labelText: "Enter a new Contact Name",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: _numberTextController,
                  decoration: const InputDecoration(
                    labelText: "Enter a new Contact Number",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: _emailTextController,
                  decoration: const InputDecoration(
                    labelText: "Enter a new Contact Email",
                    border: InputBorder.none,
                  ),
                ),
              ),
              const Spacer(),
              Align(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        _addTodoItem(
                            _nameTextController.text,
                            _numberTextController.text,
                            _emailTextController.text);
                        Navigator.of(context).pop();
                      },
                      child: const Text("Add"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
