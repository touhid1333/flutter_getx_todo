import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_todo/views/elements/form_page_ui.dart';
import 'package:get/get.dart';

class AddNewUI extends StatelessWidget {
  const AddNewUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: const Icon(CupertinoIcons.back),
        ),
        title: const Text("Add New"),
      ),
      body: FormPageUI(),
    );
  }
}
