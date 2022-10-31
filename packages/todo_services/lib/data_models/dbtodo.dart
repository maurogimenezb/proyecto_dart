import 'package:flutter/foundation.dart';

class DBTodo { 
  //int id;
  String nombre;
  String apellido;
  //String ci;
  /*String establ;
  String fecha;
  int cedula;
  int dosis;
  String vacuna;
  String actual;*/

  DBTodo ({
   //this.id = 0,
    this.nombre = '',
    this.apellido = '',
    //this.ci = '',

   /* this.establ = '',
    this.fecha = '',
    this.cedula = 0,
    this.dosis = 0,
    this.vacuna = '',
    this.actual = '',*/

  });

  factory DBTodo.fromMap(Map<String, dynamic> json) => DBTodo (
   // id: json ['id'] ?? 0,
    nombre: json ['nombre'] ?? '',
    apellido: json ['apellido'] ?? '',
    /*establ: json ['establ'] ?? '',
    fecha: json ['fecha'] ?? '',
    cedula: json ['cedula'] ?? 0,
    dosis: json ['dosis'] ?? 0,
    vacuna: json ['vacuna'] ?? '',
    actual: json ['actual'] ?? '',*/

  );

  Map <String, dynamic> toMap () => {
    //"id": id,
    "nombre": nombre,
    "apellido": apellido,
   /* "establ": establ,
    "fecha": fecha,
    "cedula": cedula,
    "dosis": dosis,
    "vacuna": vacuna,
    "actual": actual,*/
  };

}