
import 'package:isar/isar.dart';

import '../../domain/models/todo.dart';

part 'isar_todo.g.dart';

@collection
final class TodoIsar{
  Id id = Isar.autoIncrement;
  late String title;
  late String description;
  late bool isDone = false;

  // convert isar object to a pure todo object
  Todo toDomain(){
    return Todo(
      id: id,
      title: title,
      description: description,
      isDone: isDone
    );
  }


  // convert pure todo object to isar object

  static TodoIsar fromDomain(Todo todo){
      return TodoIsar()
      ..id = todo.id
      ..title = todo.title
      ..description = todo.description
      ..isDone = todo.isDone;
    }


}