import 'horario.dart';

class Monitor {
  final int id;
  final String nome;
  final String foto;
  final List<Horario> horarios;

  Monitor({
    required this.id,
    required this.nome,
    required this.foto,
    required this.horarios,
  });

  factory Monitor.fromJson(Map<String, dynamic> json) {
    List<Horario> horarios = [];

    Map<String, dynamic> dias = json['horarios'];
    dias.forEach((dia, lista) {
      for (var texto in lista) {
        horarios.add(Horario(dia: dia, horario: texto));
      }
    });

    return Monitor(
      id: json['id'],
      nome: json['nome'],
      foto: json['foto'],
      horarios: horarios,
    );
  }
}