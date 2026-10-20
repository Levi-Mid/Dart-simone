import 'package:flutter/material.dart';

import '../../models/monitor.dart';
import 'monitor_card.dart';

class MonitorCarrossel extends StatelessWidget {
  final List<Monitor> monitores;
  final void Function(Monitor) aoTocar;

  MonitorCarrossel({
    super.key,
    required this.monitores,
    required this.aoTocar,
  });

  final PageController controller = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 300,
          child: PageView.builder(
            controller: controller,
            itemCount: monitores.length,
            itemBuilder: (context, index) {
              final monitor = monitores[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: MonitorCard(
                  monitor: monitor,
                  onTap: () => aoTocar(monitor),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        const Text('Arraste para o lado para ver mais'),
      ],
    );
  }
}