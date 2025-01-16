

// each cubit is a list of todos
import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/models/todo.dart';
import '../domain/repository/todo_repo.dart';


class TodoCubit extends Cubit<List<Todo>>{

  // reference to the todoRepo
  final TodoRepo todoRepo;

  //constructor for TodoCubit
  TodoCubit(this.todoRepo) : super([]){
    loadTodos();
  }

  // L O A D
  Future<void> loadTodos() async {
    final todos = await todoRepo.getTodos();
    emit(todos); /// Emit the fetched list as a new state
  }

  // A D D
  Future<void> addTodo(String title, String description)async {
    final todo = Todo(
        id: DateTime.now().microsecondsSinceEpoch,
        title: title,
        description: description,
        isDone: false);

    await todoRepo.addTodo(todo);
    
    loadTodos();

  }

  // D E L E T E
  Future<void> deleteTodo(Todo todo)async {
      await todoRepo.deleteTodo(todo);

      loadTodos();
  }

  // T O G G L E
  Future<void> toggleCompletion(Todo todo)async{
    final updatedTodo= todo.toggleCompletion();

    await todoRepo.updateTodo(updatedTodo);

    loadTodos();
  }




}