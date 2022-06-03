import 'dart:math';
import 'package:flutter_getx_todo/models/todo_model.dart';
import 'package:get/get.dart';

class ToDoController extends GetxController {
  RxList<TODOModel> _allTodos = <TODOModel>[].obs;

  //getter for our list
  RxList get allTodos => _allTodos;

  //setter for new item in the list
  addNewTodo(String title, String desc) {
    Random random = Random();
    int todoId = random.nextInt(100);
    TODOModel newModel =
        TODOModel(todoId: todoId, todoTitle: title, todoDesc: desc);
    _allTodos.value.add(newModel);
  }

  //remove item from list
  removeFromToDos(int id) {
    _allTodos.value.removeWhere((element) => element.todoId == id);
  }
}
