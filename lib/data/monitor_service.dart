import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/monitor.dart';

class MonitorService {
  final String url =
      'https://api.mockfly.dev/mocks/7a1e84d2-785a-4f83-b0bb-6607e59ecdfc/monitoria';

  Future<List<Monitor>> buscarMonitores() async {
    final resposta = await http.get(Uri.parse(url));

    if (resposta.statusCode == 200) {
      List dados = jsonDecode(resposta.body);
      return dados.map((item) => Monitor.fromJson(item)).toList();
    } else {
      throw Exception('Erro ao carregar os monitores');
    }
  }
}