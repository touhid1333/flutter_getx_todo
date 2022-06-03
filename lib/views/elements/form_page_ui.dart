import 'package:flutter/material.dart';
import 'package:flutter_getx_todo/controllers/todo_controller.dart';
import 'package:flutter_getx_todo/services/route_name.dart';
import 'package:get/get.dart';

class FormPageUI extends StatelessWidget {
  FormPageUI({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter title";
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  )),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _descController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter description";
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(
                  hintText: "Description",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  )),
              keyboardType: TextInputType.multiline,
              minLines: 6,
              maxLines: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Get.find<ToDoController>()
                      .addNewTodo(_titleController.text, _descController.text);
                  Get.snackbar("Success", "Added to TODO list.",
                      backgroundColor: Colors.green,
                      snackPosition: SnackPosition.BOTTOM);
                  Get.offAllNamed(RouteName.dashboardRoute);
                }
              },
              child: const SizedBox(
                  width: 100, height: 45, child: Center(child: Text("Add"))),
            ),
          ],
        ),
      ),
    );
  }
}
