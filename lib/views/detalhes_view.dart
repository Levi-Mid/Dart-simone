import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/monitor.dart';
import '../viewmodels/monitor_viewmodel.dart';

class DetalhesView extends StatelessWidget {
  final Monitor monitor;
  final String dia;

  const DetalhesView({super.key, required this.monitor, required this.dia});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<MonitorViewModel>();
    final horarios = vm.horariosDoMonitor(monitor, dia);

    return Scaffold(
      appBar: AppBar(title: Text(monitor.nome)),
      body: Column(
        children: [
          const SizedBox(height: 24),
          ClipOval(
            child: Image.network(
              monitor.foto,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
              webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            dia == 'todos' ? 'Todos os horários' : 'Horários de ${vm.nomesDias[dia]}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: horarios.length,
              itemBuilder: (context, index) {
                final horario = horarios[index];
                return ListTile(
                  leading: const Icon(Icons.access_time),
                  title: Text(horario.horario),
                  subtitle: dia == 'todos' ? Text(vm.nomesDias[horario.dia]!) : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}