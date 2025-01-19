import 'package:flutter/material.dart';
import 'package:local_storage_todo_app/application.dart';
import 'package:local_storage_todo_app/core/database/local_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDatabase.instance.createDatabase();

  runApp(
    const Application(),
  );
}
