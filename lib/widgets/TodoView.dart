import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:tes_gudang_kripto/models/Todo.dart';
import 'package:tes_gudang_kripto/screens/EditTodoScreen.dart';
import 'package:tes_gudang_kripto/screens/ViewTodoScreen.dart';
import 'package:tes_gudang_kripto/utils/Colors.dart';

class TodoView extends StatefulWidget {
  final Todo todo;
  const TodoView({super.key, required this.todo});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {

  delete(){
    Get.defaultDialog(
        title: "Delete this Todo ?",
        middleText: "",
        textConfirm: "Delete",
        textCancel: "Cancel",
        cancelTextColor: pink,
        confirmTextColor: black,
        onConfirm: (){
          widget.todo.delete();
          Get.back();
        },
      );

  }

  edit(){
    Get.to(() => EditTodoScreen(todo: widget.todo));
  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.todo.title, overflow: TextOverflow.ellipsis,),
      subtitle: Text(widget.todo.description, overflow: TextOverflow.ellipsis,),
      onTap: (){
        Get.to(() => ViewTodoScreen(todo: widget.todo));
      },
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(onPressed: edit, icon: Icon(Icons.edit)),
            IconButton(onPressed: delete, icon: Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}