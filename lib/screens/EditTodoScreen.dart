import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tes_gudang_kripto/utils/Colors.dart';
import 'package:tes_gudang_kripto/widgets/Input.dart';

import '../models/Todo.dart';

class EditTodoScreen extends StatefulWidget {
    final Todo todo;

  const EditTodoScreen({super.key, required this.todo});


  @override
  State<EditTodoScreen> createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    titleController.text = widget.todo.title;
    descriptionController.text = widget.todo.description;
    super.initState();
  }

  edit(){
    widget.todo.edit(titleController.text, descriptionController.text);
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
          TextButton(
            onPressed: (){
              edit();
            },
            child: Text(
              "Edit",
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