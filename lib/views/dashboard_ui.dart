import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_todo/controllers/todo_controller.dart';
import 'package:flutter_getx_todo/services/route_name.dart';
import 'package:flutter_getx_todo/views/elements/dashboard_list_view_ui.dart';
import 'package:get/get.dart';

class DashboardUI extends StatelessWidget {
  const DashboardUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.home_filled),
            SizedBox(
              width: 10,
            ),
            Text("ToDO"),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(RouteName.removeRoute);
              },
              icon: const Icon(CupertinoIcons.trash_fill)),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child:
                  Obx(() => Get.find<ToDoController>().allTodos.value.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              Get.find<ToDoController>().allTodos.value.length,
                          itemBuilder: (context, index) {
                            return ListViewUI(
                                nowItem: Get.find<ToDoController>()
                                    .allTodos
                                    .value[index]);
                          },
                        )
                      : Center(child: Image.asset("assets/404_no_data.jpg"))),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(RouteName.addNewRoute);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
