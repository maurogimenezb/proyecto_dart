import 'dart:ffi';

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
  TextEditingController keyword = TextEditingController();
@override 
Widget build (BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration (
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: TextField(
        controller: keyword,
        onSubmitted: (value) {
          setState(() {
            keyword == value;
          });
        },
        decoration: InputDecoration (
          prefixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                TodoRepository().searchTodo(keyword.text);
              });
            },
          ),
          suffixIcon: IconButton (
            icon: const Icon(Icons.clear),
            onPressed: () {
              keyword.text = '';
            },
          ),
          hintText: 'Buscar por Nombre',
          border: InputBorder.none,
        ),
        ),
        )),
    ),  
    // paso 4 aggregar en pantalla lod datos
    body: FutureBuilder(
     future: keyword.text.length > 0 ? TodoRepository().searchTodo(keyword.text) : TodoRepository().getAllTodo(),
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
                        title: Text(todo[index].nombre + ' ' + todo[index].apellido + ' ' + todo[index].nombre,
                          //todo[index].nombre,
                        ),
                        /* trailing: IconButton (
                          onPressed: () {
                            setState(() {
                              TodoRepository().deleteTodoId(todo[index].id);
                           });
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),*/
                        subtitle: Text (
                         // todo[index].id.toString(),
                          todo[index].nombre,

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