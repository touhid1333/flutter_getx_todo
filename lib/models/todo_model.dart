
class TODOModel{

  int? todoId;
  String? todoTitle;
  String? todoDesc;

  TODOModel({this.todoId, this.todoTitle, this.todoDesc});

  @override
  String toString() {
    return 'TODOModel{todoId: $todoId, todoTitle: $todoTitle, todoDesc: $todoDesc}';
  }
}