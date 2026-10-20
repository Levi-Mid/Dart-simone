import 'horario.dart';

class Monitor {
  final int id;
  final String nome;
  final String foto;
  final List<Horario> horarios;

  Monitor(this.id, this.nome, this.foto, this.horarios);

  factory Monitor.fromJson(Map<String, dynamic> json) {
    List<Horario> horarios = [];

    Map<String, dynamic> dias = json['horarios'];
    dias.forEach((dia, lista) {
      for (var texto in lista) {
        horarios.add(Horario(dia, texto));
      }
    });

    return Monitor(json['id'], json['nome'], json['foto'], horarios);
  }
}