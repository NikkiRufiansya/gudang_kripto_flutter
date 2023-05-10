import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:tes_gudang_kripto/controllers/TodoController.dart';

class TodoBox {
  getTodo(){
    
    return Hive.box("todoBox").get("todos", defaultValue: []);
  }

  putTodo(List data)async{
    final TodoController todoController = Get.find();
    await Hive.box("todoBox").put("todos", data);
    List todos = getTodo();
    todoController.setTodos(data);
  }
}