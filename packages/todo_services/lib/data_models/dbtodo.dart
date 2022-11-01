import 'package:flutter/foundation.dart';

class DBTodo { 
  //int id;
  String nombre;
  String apellido;
  String ci;
  String establ;
  String fecha;
  String dosis;
  String vacuna;
  String actual;

  DBTodo ({
  // this.id = 0,
    this.nombre = '',
    this.apellido = '',
    this.ci = '',
    this.establ = '',
    this.fecha = '',
    this.dosis = '',
    this.vacuna = '',
    this.actual = '',

  });

  factory DBTodo.fromMap(Map<String, dynamic> json) => DBTodo (
   // id: json ['id'] ?? 0,
    nombre: json ['nombre'] ?? '',
    apellido: json ['apellido'] ?? '',
    ci: json ['ci'] ?? '',
    establ: json ['establ'] ?? '',
    fecha: json ['fecha'] ?? '',
    dosis: json ['dosis'] ?? '',
    vacuna: json ['vacuna'] ?? '',
    actual: json ['actual'] ?? '',

  );

  Map <String, dynamic> toMap () => {
    //"id": id,
    "nombre": nombre,
    "apellido": apellido,
    "ci": ci,
    "establ": establ,
    "fecha": fecha,
    "dosis": dosis,
    "vacuna": vacuna,
    "actual": actual,
  };

}