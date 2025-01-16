
// database repository


import 'package:bloc_practice/data/models/isar_todo.dart';
import 'package:isar/isar.dart';

import '../../domain/models/todo.dart';
import '../../domain/repository/todo_repo.dart';

class IsarTodoRepo implements TodoRepo {
  final Isar db;
  IsarTodoRepo(this.db);

  @override
  Future<List<Todo>> getTodos() async {
    final todos = await  db.todoIsars.where().findAll();
    return todos.map((e) => e.toDomain()).toList();
  }

  @override
  Future<void> addTodo(Todo todo) async {
    // TODO: implement addTodo
    final todoIsar = TodoIsar.fromDomain(todo);

    return await db.writeTxn(()=> db.todoIsars.put(todoIsar));
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    // TODO: implement deleteTodo
    await db.writeTxn(() => db.todoIsars.delete(todo.id));
  }

  @override
  Future<void> updateTodo(Todo todo) {
    // TODO: implement updateTodo
    final todoIsar = TodoIsar.fromDomain(todo);

    return db.writeTxn(()=> db.todoIsars.put(todoIsar));
  }

}