import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/monitor_carrossel.dart';

import '../viewmodels/monitor_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<MonitorViewModel>();

    Widget conteudo;

    if (vm.carregando) {
      conteudo = const CircularProgressIndicator();
    } else if (vm.diaSelecionado == null) {
      conteudo = const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.menu, size: 64),
          SizedBox(height: 16),
          Text(
            'Selecione um dia no menu',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 8),
          Text('para ver os monitores disponíveis'),
        ],
      );
    } else {
        conteudo = MonitorCarrossel(
        key: ValueKey(vm.diaSelecionado),
        monitores: vm.monitoresFiltrados,
        aoTocar: (monitor) {
          // na próxima etapa: abrir a tela de detalhes
        },
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Monitores DCOMP')),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Center(
                child: Text(
                  'Filtrar por dia',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            for (var opcao in vm.opcoesMenu)
              ListTile(
                title: Text(vm.nomesDias[opcao]!),
                selected: vm.diaSelecionado == opcao,
                onTap: () {
                  vm.selecionarDia(opcao);
                  Navigator.pop(context);
                },
              ),
          ],
        ),
      ),
      body: Center(child: conteudo),
    );
  }
}