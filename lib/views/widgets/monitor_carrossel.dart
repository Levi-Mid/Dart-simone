import 'package:flutter/material.dart';

import '../../models/monitor.dart';
import 'monitor_card.dart';

class MonitorCarrossel extends StatefulWidget {
  final List<Monitor> monitores;
  final void Function(Monitor) aoTocar;

  const MonitorCarrossel({
    super.key,
    required this.monitores,
    required this.aoTocar,
  });

  @override
  State<MonitorCarrossel> createState() => _MonitorCarrosselState();
}

class _MonitorCarrosselState extends State<MonitorCarrossel> {
  final PageController controller = PageController(viewportFraction: 0.75);
  int paginaAtual = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 300,
          child: PageView.builder(
            controller: controller,
            itemCount: widget.monitores.length,
            onPageChanged: (index) {
              setState(() {
                paginaAtual = index;
              });
            },
            itemBuilder: (context, index) {
              final monitor = widget.monitores[index];
              return AnimatedPadding(
                duration: const Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: index == paginaAtual ? 0 : 30,
                ),
                child: MonitorCard(
                  monitor: monitor,
                  onTap: () => widget.aoTocar(monitor),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < widget.monitores.length; i++)
              Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: i == paginaAtual ? cores.primary : cores.outlineVariant,
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        const Text('Arraste para o lado para ver mais'),
      ],
    );
  }
}