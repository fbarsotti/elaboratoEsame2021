import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:studio_lab/core/utils/wc_host.dart';
import 'package:studio_lab/feature/statistics/sondaggio/data/model/sondaggio_remote_model.dart';

class StatisticsRemoteDatasource {
  String host = WCHost.hostPath;

  Future<List<SondaggioRemoteModel>> getAllSondaggi() async {
    final response = await http.get(
      Uri.http(host, '/sondaggi'),
    );
    final list = json.decode(response.body) as List;
    List<SondaggioRemoteModel> sondaggi = list
        .map(
          (e) => SondaggioRemoteModel.fromJson(e),
        )
        .toList();
    return sondaggi;
  }
}
