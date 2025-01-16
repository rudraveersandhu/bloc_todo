
import 'package:bloc_practice/presentation/todo_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/models/todo.dart';

class TodoView extends StatelessWidget {
   TodoView({super.key});


  _showAddTodoBox(BuildContext context){
    final todoCubit = context.read<TodoCubit>();
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    
    showDialog(context: context, builder: (builder)=> AlertDialog(
      title: Text("Add Todo"),
      content: Column(
        children: [
          TextField(controller: titleController,),
          TextField(controller: descriptionController,),
        ],
      ),
      actions: [
        TextButton(onPressed: ()async{
          await todoCubit.addTodo(titleController.text, descriptionController.text);
          Navigator.of(context).pop();
        }, child: Text("Add")),
        TextButton(onPressed: ()async{

          Navigator.of(context).pop();
        }, child: Text("cancel"))
      ],
    ));

  }

  @override
  Widget build(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_circle_outline),
          onPressed: ()=> _showAddTodoBox(context)
      ),
      body: BlocBuilder<TodoCubit,List<Todo>>(
        builder: (context,todos){

          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context,index){

              final todo = todos[index];
              return ListTile(
                title: Text(todo.title),
                subtitle: Text(todo.description),
                trailing: Checkbox(
                  value: todo.isDone,
                  onChanged: (value){
                    todoCubit.toggleCompletion(todo);
                    //or
                    //context.read<TodoCubit>().toggleCompletion(todo);

                  },
                ),
                onLongPress: ()=> todoCubit.deleteTodo(todo),
              );
            },
          );
        },
      ),
    );
  }
}
