
import 'package:flutter/material.dart';
import 'package:todo_models/todo_model.dart';
import 'package:todo_repository/todo_repositories.dart';

class CreateTodo extends StatelessWidget {
  TextEditingController teNombre = TextEditingController();
  TextEditingController teApellido = TextEditingController();

  CreateTodo({super.key});

  @override 
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 10,
              left: 15,
              right: 15,
            ),
            child: TextField (
              controller: teNombre,
              decoration: const InputDecoration(
                hintText: 'Escribir Nombre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5),
                  ),
                )),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
              left: 15,
              right: 15,
            ),
            child: TextField (
              controller: teApellido,
              decoration: const InputDecoration(
                hintText: 'Escribir Apellido',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5),
                  ),
                )),
            ),
          ),

          Container( 
            width:  double.infinity,
            height: 60,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: const EdgeInsets.all(15),
            child: ElevatedButton (
              onPressed: (){
                final todo = TodoModel(
                  //id: 2, 
                  nombre: teNombre.text, 
                  apellido: teApellido.text, 
                  );

                  TodoRepository().addTodo(todo);
                  Navigator.pop(context);
              },
              child: const Text('Guardar'),
            ),
          )
        ],
        ),
    );
  }
}