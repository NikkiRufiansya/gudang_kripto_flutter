import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:tes_gudang_kripto/controllers/TodoController.dart';
import 'package:tes_gudang_kripto/models/Todo.dart';
import 'package:tes_gudang_kripto/utils/Colors.dart';

import '../widgets/Input.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final TodoController todoController = Get.put(TodoController());

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  add() {
    Todo todos = Todo(
        id: todoController.todos.length,
        title: titleController.text,
        description: descriptionController.text);
    todos.add();
  }
  

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        backgroundColor: pink,
      ),
      body: ListView(
        children: [
          Input(
              labelText: "Title",
              icon: Icon(Icons.title, color: pink),
              textEditingController: titleController
          ),
          Input(
              labelText: "Description",
              icon: Icon(Icons.notes, color: pink),
              textEditingController: descriptionController
          ),
          SizedBox(height: 20.0,),
          TextButton(
            onPressed: (){
              add();
            },
            child: Text(
              "Add",
              style: TextStyle(
                  fontSize: 14
              ),
            ),
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15.0)),
              foregroundColor: MaterialStateProperty.all<Color>(white),
              backgroundColor: MaterialStateProperty.all<Color>(pink),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(color: pink)
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}
