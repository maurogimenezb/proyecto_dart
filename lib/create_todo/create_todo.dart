
import 'package:flutter/material.dart';
import 'package:todo_models/todo_model.dart';
import 'package:todo_repository/todo_repositories.dart';

class CreateTodo extends StatelessWidget {
  TextEditingController teNombre = TextEditingController();
  TextEditingController teApellido = TextEditingController();
  TextEditingController teCi = TextEditingController();
  TextEditingController teEstabl = TextEditingController();
  TextEditingController teFecha = TextEditingController();
  TextEditingController teDosis = TextEditingController();
  TextEditingController teVacuna = TextEditingController();
  TextEditingController teActual = TextEditingController();

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
            margin: const EdgeInsets.only(
              top: 10,
              left: 15,
              right: 15,
            ),
            child: TextField (
              controller: teEstabl,
              decoration: const InputDecoration(
                hintText: 'Escribir Establecimiento',
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
              controller: teFecha,
              decoration: const InputDecoration(
                hintText: 'Escribir Fecha de Aplicacion',
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
              controller: teDosis,
              decoration: const InputDecoration(
                hintText: 'Escribir Dosis',
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
              controller: teVacuna,
              decoration: const InputDecoration(
                hintText: 'Escribir nombre de Vacuna',
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
              controller: teActual,
              decoration: const InputDecoration(
                hintText: 'Escribir Ultima Actualizacion',
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
                  //id: 0, 
                  nombre: teNombre.text, 
                  apellido: teApellido.text, 
                  ci: teCi.text,
                  establ: teEstabl.text,
                  fecha: teFecha.text,
                  dosis: teDosis.text,
                  vacuna: teVacuna.text,
                  actual: teActual.text,

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