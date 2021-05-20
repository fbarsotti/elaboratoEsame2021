import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:studio_lab/core/utils/wc_host.dart';
import 'package:studio_lab/feature/statistics/risposte/data/model/risposta_remote_model.dart';

class RisposteRemoteDatasource {
  String host = WCHost.hostPath;

  Future<List<RispostaRemoteModel>> getRisposteByDomanda(
    int domandaId,
  ) async {
    final response = await http.get(
      Uri.http(host, 'rispostebydomanda/$domandaId'),
    );

    final list = json.decode(response.body) as List;
    List<RispostaRemoteModel> risposte = list
        .map(
          (e) => RispostaRemoteModel.fromJson(e),
        )
        .toList();
    return risposte;
  }
}
