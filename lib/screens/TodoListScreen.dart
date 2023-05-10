import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:tes_gudang_kripto/controllers/TodoController.dart';
import 'package:tes_gudang_kripto/hive/TodoBox.dart';
import 'package:tes_gudang_kripto/screens/AddTodoScreen.dart';
import 'package:tes_gudang_kripto/utils/Colors.dart';
import 'package:tes_gudang_kripto/widgets/TodoView.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {

  getTodo() async {
    final TodoController todoController = Get.put(TodoController());
    
    await todoController.setTodos(TodoBox().getTodo());
  }

  @override
  void initState() {
    // TODO: implement initState
    getTodo();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pink,
        title: Text("Todo App"),
        centerTitle: true,
      ),
      body: GetBuilder(
        builder: (TodoController todoController){
          return todoController.todos.length == 0 ? Center(
            child: Text("No data found !"),
          ): ListView.builder(
              itemCount: todoController.todos.length,
              itemBuilder: (context, index){
                return TodoView(todo: todoController.todos[index]);
              }
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddTodoScreen());
        },
        child: Icon(Icons.add, color: white),
        backgroundColor: pink,
      ),
    );
  }
}