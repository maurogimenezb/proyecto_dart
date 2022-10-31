import 'package:todo_models/todo_model.dart';
import 'package:todo_services/data_models/dbtodo.dart';
import 'package:todo_services/database.dart';


class TodoRepository {
Future <void> addTodo(TodoModel todo) async { //Posible error en TodoModel
await DBProvider.db.addTodo(DBTodo(
//id: todo.id,
nombre: todo.nombre,
apellido: todo.apellido,
//ci: todo.ci,
/*establ: todo.establ,
fecha: todo.fecha,
cedula: todo.cedula,
dosis: todo.dosis,
vacuna: todo.vacuna,
actual: todo.actual,*/
));
}
//Paso 4
Future <List<TodoModel>> getAllTodo() async {
  final tt = await DBProvider.db.getAllTodo();
  return tt.
  map((e) => TodoModel(
       //id: e.id, 
       nombre: e.nombre, 
       apellido: e.apellido,
       //ci: e.ci,

       )).
       toList();

}

Future <List<TodoModel>> searchTodo (String keyword) async {
  final tt = await DBProvider.db.searchTodo(keyword);
  return tt
  .map((e) => TodoModel(
    nombre: e.nombre, 
    apellido: e.apellido,))
    .toList();
}

Future<void> deleteTodoId (int id) async {
  await DBProvider.db.deleteTodoId(id);
}
}