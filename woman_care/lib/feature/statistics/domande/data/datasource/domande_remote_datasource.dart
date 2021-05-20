import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:studio_lab/core/utils/wc_host.dart';
import 'package:studio_lab/feature/statistics/domande/data/model/domanda_remote_model.dart';

class DomandeRemoteDatasource {
  String host = WCHost.hostPath;

  Future<List<DomandaRemoteModel>> getAllDomande(int sondaggioId) async {
    final response = await http.get(Uri.http(host, 'domande/$sondaggioId'));

    final list = json.decode(response.body) as List;
    List<DomandaRemoteModel> domande =
        list.map((e) => DomandaRemoteModel.fromJson(e)).toList();
    return domande;
  }
}
