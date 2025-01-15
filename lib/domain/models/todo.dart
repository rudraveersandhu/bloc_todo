
class Todo{
  final int id;
  final String title;
  final String description;
  final bool isDone;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.isDone
  });

  Todo toggleCompletion(){
    return Todo(
      id: id,
      title: title,
      description: description,
      isDone: !isDone
    );
  }

}