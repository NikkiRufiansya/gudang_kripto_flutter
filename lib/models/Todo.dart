import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:hive/hive.dart';
import 'package:tes_gudang_kripto/controllers/TodoController.dart';
import 'package:tes_gudang_kripto/hive/TodoBox.dart';
import 'package:tes_gudang_kripto/screens/ViewTodoScreen.dart';

part 'Todo.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  late int id;

  @HiveField(1)
  late String title;

  @HiveField(2)
  late String description;

  Todo({required this.id, required this.title, required this.description});

  add() {
    final TodoController todoController = Get.find();
    List todos = todoController.todos;
    todos.add(this);
    TodoBox().putTodo(todos);
    Get.off(() => ViewTodoScreen(todo: this));
    Get.snackbar("Add", "Success", snackPosition: SnackPosition.BOTTOM);
  }

  @override
  delete() async {
    final TodoController todoController = Get.put(TodoController());
    List todos = todoController.todos;
    todos.remove(this);
    TodoBox().putTodo(todos);
    Get.snackbar("Delete", "Success", snackPosition: SnackPosition.BOTTOM);
  }

  edit(String title, String description) async {
    this.title = title;
    this.description = description;
    final TodoController todoController = Get.put(TodoController());
    List todos = todoController.todos;
    todos[this.id] = this;
    TodoBox().putTodo(todos);
    Get.off(() => ViewTodoScreen(todo: this));
    Get.snackbar("Edit", "Success", snackPosition: SnackPosition.BOTTOM);
  }
}
