import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tes_gudang_kripto/models/Todo.dart';
import 'package:tes_gudang_kripto/utils/Colors.dart';

class ViewTodoScreen extends StatefulWidget {
  final Todo todo;
  const ViewTodoScreen({super.key, required this.todo});

  @override
  State<ViewTodoScreen> createState() => _ViewTodoScreenState();
}

class _ViewTodoScreenState extends State<ViewTodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pink,
      ),
      body: ListView(
        children: [
          SizedBox(height: 15.0),
          Text(widget.todo.title),
          SizedBox(height: 15.0),
          Divider(),
          SizedBox(height: 15.0),
          Text(widget.todo.description)
        ],
      ),
    );
  }
}