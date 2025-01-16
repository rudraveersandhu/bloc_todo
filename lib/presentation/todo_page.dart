
import 'package:bloc_practice/presentation/todo_cubit.dart';
import 'package:bloc_practice/presentation/todo_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/repository/todo_repo.dart';

class TodoPage extends StatelessWidget {
  final TodoRepo todoRepo;
  const TodoPage({super.key,required this.todoRepo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (create)=>TodoCubit(todoRepo),
      child: TodoView(),
    );
  }
}
