import 'package:bloc_practice/counter/counterPage.dart';
import 'package:bloc_practice/data/models/isar_todo.dart';
import 'package:bloc_practice/presentation/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'data/repository/isar_todo_repo.dart';
import 'domain/repository/todo_repo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //get directory path for storing data
  final dir = await getApplicationDocumentsDirectory();

  // open the isar database
  final isar = await Isar.open([TodoIsarSchema], directory: dir.path);

  // initialise the repo with isar database
  final isarTodoRepo = IsarTodoRepo(isar);

  runApp(MyApp(todoRepo: isarTodoRepo,));
}

class MyApp extends StatelessWidget {
  // inject database through the app main
  final TodoRepo todoRepo;

  const MyApp({super.key, required this.todoRepo});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoPage(todoRepo: todoRepo),
      //home: CounterPage()
    );
  }
}
