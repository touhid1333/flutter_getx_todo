
import 'package:flutter_getx_todo/controllers/todo_controller.dart';
import 'package:get/get.dart';

class InitControllers extends Bindings{
  @override
  void dependencies() {
    //initialize all our controllers
    Get.lazyPut(() => ToDoController());
  }
}