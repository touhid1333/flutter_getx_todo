import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_todo/controllers/todo_controller.dart';
import 'package:flutter_getx_todo/models/todo_model.dart';
import 'package:flutter_getx_todo/services/route_name.dart';
import 'package:get/get.dart';

class RemoveUI extends StatelessWidget {
  const RemoveUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ToDoController>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(CupertinoIcons.back),
        ),
        title: const Text("Remove"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Expanded(
                child: Obx(() => controller.allTodos.value.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.allTodos.value.length,
                        itemBuilder: (context, index) {
                          TODOModel currentItem =
                              controller.allTodos.value[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: ListTile(
                              onTap: () {
                                Get.defaultDialog(
                                    title: "Remove",
                                    middleText: "Are you sure?",
                                    textConfirm: "Confirm",
                                    textCancel: "Cancel",
                                    contentPadding: const EdgeInsets.all(20),
                                    radius: 10,
                                    onConfirm: () {
                                      controller
                                          .removeFromToDos(currentItem.todoId!);
                                      Get.offAllNamed(RouteName.dashboardRoute);
                                    });
                              },
                              tileColor: Colors.deepPurple.shade100,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              leading: Text(
                                currentItem.todoTitle!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                            ),
                          );
                        })
                    : Center(child: Image.asset("assets/404_no_data.jpg"))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
