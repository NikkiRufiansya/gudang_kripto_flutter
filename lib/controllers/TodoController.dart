import 'package:get/get_state_manager/get_state_manager.dart';

class TodoController extends GetxController{
  
  List _todos = [];

  List get todos => _todos;
  
  setTodos(List data){
    _todos = data;
    update();
  }
}