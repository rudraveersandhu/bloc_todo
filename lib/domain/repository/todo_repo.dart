
import '../models/todo.dart';

abstract class TodoRepo{

  // get the list of todos
  Future<List<Todo>> getTodos();

  //add a new to-do
  Future<void> addTodo(Todo todo);

  //update a to-dos
  Future<void> updateTodo(Todo todo);

  //delete a to-dos
  Future<void> deleteTodo(Todo todo);
}