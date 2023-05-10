import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tes_gudang_kripto/models/Todo.dart';
import 'package:tes_gudang_kripto/screens/TodoListScreen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Directory document = await getApplicationDocumentsDirectory();
  Hive..init(document.path)..registerAdapter(TodoAdapter());
  await Hive.openBox("todoBox");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes',
      home: TodoListScreen(),
    );
  }
}