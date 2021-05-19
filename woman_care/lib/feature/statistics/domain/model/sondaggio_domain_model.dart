import 'package:studio_lab/feature/statistics/data/model/sondaggio_remote_model.dart';

class SondaggioDomainModel {
  int id;
  String titolo;
  String dataCreazione;
  int idCommittente;

  SondaggioDomainModel({
    this.id,
    this.titolo,
    this.dataCreazione,
    this.idCommittente,
  });

  SondaggioDomainModel.fromRemoteModel(SondaggioRemoteModel r) {
    id = r.id;
    titolo = r.titolo;
    dataCreazione = r.dataCreazione;
    idCommittente = r.idCommittente;
  }
}
