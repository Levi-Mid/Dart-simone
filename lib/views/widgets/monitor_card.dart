import 'package:flutter/material.dart';

import '../../models/monitor.dart';

class MonitorCard extends StatelessWidget {
  final Monitor monitor;
  final VoidCallback onTap;

  const MonitorCard({super.key, required this.monitor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red.shade100,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Image.network(
                monitor.foto,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
                webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  monitor.nome,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}