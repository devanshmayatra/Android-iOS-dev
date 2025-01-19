import 'package:flutter/material.dart';
import 'package:shared_pref/services/shared_preference_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefScreen extends StatefulWidget {
  const SharedPrefScreen({super.key});

  @override
  State<SharedPrefScreen> createState() => _SharedPrefState();
}

class _SharedPrefState extends State<SharedPrefScreen> {
  final TextEditingController controller = TextEditingController();
  final service = SharedPreferenceServices();

  String name = "Hello";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(Object context) {
    return Center(
      child: Column(
        children: [
          Text(name),
          Container(
            width: 200,
            margin: const EdgeInsets.all(10.0),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: "Enter Text",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          FilledButton(
            onPressed: () {
              service.setVariable(controller.text);
              setState(() async {
                name = await service.getVariable();
              });
            },
            child: Text("SAVE"),
          )
        ],
      ),
    );
  }
}
