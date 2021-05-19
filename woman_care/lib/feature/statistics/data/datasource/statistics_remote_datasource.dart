import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:studio_lab/feature/statistics/data/model/sondaggio_remote_model.dart';

class StatisticsRemoteDatasource {
  Future<List<SondaggioRemoteModel>> getAllSondaggi() async {
    final response = await http.get(
      Uri.http('dac7e2569283.ngrok.io', '/sondaggi'),
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
