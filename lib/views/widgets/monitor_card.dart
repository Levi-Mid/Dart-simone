import 'package:flutter/material.dart';

import '../../models/monitor.dart';

class MonitorCard extends StatelessWidget {
  final Monitor monitor;
  final VoidCallback onTap;

  const MonitorCard({super.key, required this.monitor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(monitor.foto),
              ),
              const SizedBox(height: 16),
              Text(
                monitor.nome,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}