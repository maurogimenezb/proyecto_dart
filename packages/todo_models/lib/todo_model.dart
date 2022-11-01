class TodoModel {
  //final int ? id;
  final String nombre;
  final String apellido;
  final String ci;
  final String establ;
  final String fecha;
  final String dosis;
  final String vacuna;
  final String actual;

  TodoModel ({
    //this.id,
    required this.nombre,
    required this.apellido,
    required this.ci,
    required this.establ,
    required this.fecha,
    required this.dosis,
    required this.vacuna,
    required this.actual,

  });

  //int get id => null;
}