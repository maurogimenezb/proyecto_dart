import 'package:flutter/material.dart';
import 'package:proyecto_dart/create_todo/create_todo.dart';
import 'package:todo_models/todo_model.dart';
import 'package:todo_repository/todo_repositories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override 
  State <HomeScreen> createState () => _HomeScreenState ();
}

class _HomeScreenState extends State <HomeScreen> {
@override 
Widget build (BuildContext context) {
  return Scaffold(
    appBar: AppBar(),  
    // paso 4 aggregar en pantalla lod datos
    body: FutureBuilder(
     future: TodoRepository().getAllTodo(),
     builder: (context, snapshot) {
      if (snapshot.connectionState != ConnectionState.done) {
        return const Center(child: CircularProgressIndicator(),
        );
      }
      final todo = snapshot.data as List <TodoModel>;
      return ListView.builder(
        itemCount: todo.length, itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container (
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Card (
                      child: ListTile (
                        title: Text(todo[index].nombre + ' ' + todo[index].apellido + ' ' + todo[index].apellido,
                          //todo[index].nombre,
                        ),
                        trailing: IconButton (
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                        subtitle: Text (
                          todo[index].apellido,
                        ),

                      ),),
                  ),
                )
              ],
            ),
          );
        });
     },
     
     ), 
     // arriba Termina paso 4 mostrar en pantalla
    floatingActionButton: FloatingActionButton(
      onPressed: () async {
        await Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => CreateTodo(),
        ));
      }, 
      child: const Icon(Icons.create),
  ),
  );
}
}