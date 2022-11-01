import 'package:todo_models/todo_model.dart';
import 'package:todo_services/data_models/dbtodo.dart';
import 'package:todo_services/database.dart';


class TodoRepository {
Future <void> addTodo(TodoModel todo) async { //Posible error en TodoModel
//final getAllTodoD = await getAllTodo();
await DBProvider.db.addTodo(DBTodo(
//id: todo.id,
nombre: todo.nombre,
apellido: todo.apellido,
ci: todo.ci,
establ: todo.establ,
fecha: todo.fecha,
dosis: todo.dosis,
vacuna: todo.vacuna,
actual: todo.actual,
));
}
//Paso 4
Future <List<TodoModel>> getAllTodo() async {
  final tt = await DBProvider.db.getAllTodo();
  return tt.
  map((e) => TodoModel(
      // id: e.id, 
       nombre: e.nombre, 
       apellido: e.apellido,
       ci: e.ci,
       establ: e.establ,
       fecha: e.fecha,
       dosis: e.dosis,
       vacuna: e.vacuna,
       actual: e.actual,

       )).
       toList();

}

Future <List<TodoModel>> searchTodo (String keyword) async {
  final tt = await DBProvider.db.searchTodo(keyword);
  return tt
  .map((e) => TodoModel(
    nombre: e.nombre, 
    apellido: e.apellido,
    ci: e.ci,
    establ: e.establ,
    fecha: e.fecha,
    dosis: e.dosis,
    vacuna: e.vacuna,
    actual: e.actual,
    ))
    .toList();
}

Future<void> deleteTodoId (int id) async {
  await DBProvider.db.deleteTodoId(id);
}

Future<void> deleteAllTasks () async {
  await DBProvider.db.deleteAllTasks();
}
}