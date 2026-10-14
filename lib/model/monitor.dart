import 'dia_semana.dart';
import 'horario.dart';

class Monitor {
  final int id;
  final String nome;
  final String foto;
  final List<Horario> horarios;

  const Monitor({
    required this.id,
    required this.nome,
    required this.foto,
    required this.horarios,
  });

  factory Monitor.fromJson(Map<String, dynamic> json) {
    final mapaHorarios = json['horarios'] as Map<String, dynamic>;
    final horarios = <Horario>[];

    mapaHorarios.forEach((chave, lista) {
      final dia = DiaSemana.values.byName(chave);
      for (final texto in lista as List) {
        horarios.add(Horario.fromTexto(dia, texto as String));
      }
    });

    return Monitor(
      id: json['id'] as int,
      nome: json['nome'] as String,
      foto: json['foto'] as String,
      horarios: horarios,
    );
  }
}