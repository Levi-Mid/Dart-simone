import 'package:flutter/material.dart';

import '../data/monitor_service.dart';
import '../models/horario.dart';
import '../models/monitor.dart';

class MonitorViewModel extends ChangeNotifier {
  final MonitorService service = MonitorService();

  List<Monitor> todosMonitores = [];
  String? diaSelecionado;
  bool carregando = false;

  final List<String> opcoesMenu = [
    'segunda',
    'terca',
    'quarta',
    'quinta',
    'sexta',
    'todos',
  ];

  final Map<String, String> nomesDias = {
    'segunda': 'Segunda',
    'terca': 'Terça',
    'quarta': 'Quarta',
    'quinta': 'Quinta',
    'sexta': 'Sexta',
    'sabado': 'Sábado',
    'todos': 'Todos',
  };

  Future<void> carregarMonitores() async {
    carregando = true;
    notifyListeners();

    todosMonitores = await service.buscarMonitores();

    carregando = false;
    notifyListeners();
  }

  void selecionarDia(String dia) {
    diaSelecionado = dia;
    notifyListeners();
  }

  List<Monitor> get monitoresFiltrados {
    if (diaSelecionado == null) {
      return [];
    }
    if (diaSelecionado == 'todos') {
      return todosMonitores;
    }
    return todosMonitores
        .where((monitor) => monitor.horarios.any((h) => h.dia == diaSelecionado))
        .toList();
  }

  List<Horario> horariosDoMonitor(Monitor monitor, String dia) {
    if (dia == 'todos') {
      return monitor.horarios;
    }
    return monitor.horarios.where((h) => h.dia == dia).toList();
  }
}