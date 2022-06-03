
import 'package:flutter/material.dart';
import 'package:flutter_getx_todo/models/todo_model.dart';

class ListViewUI extends StatelessWidget {
  ListViewUI({Key? key, required this.nowItem}) : super(key: key);

  TODOModel nowItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepPurpleAccent.shade100,
      elevation: 2.5,
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: double.maxFinite,
              child: Text(
                nowItem.todoTitle!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(nowItem.todoDesc!),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}