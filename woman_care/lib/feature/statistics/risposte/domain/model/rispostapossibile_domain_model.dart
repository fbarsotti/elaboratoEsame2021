import 'package:studio_lab/feature/statistics/risposte/data/model/rispostapossibile_remote_model.dart';

class RispostaPossibileDomainModel {
  int id;
  String contenuto;
  int idDomanda;

  RispostaPossibileDomainModel({
    this.id,
    this.contenuto,
    this.idDomanda,
  });

  RispostaPossibileDomainModel.fromRemoteModel(RispostaPossibileRemoteModel r) {
    id = r.id;
    contenuto = r.contenuto;
    idDomanda = r.idDomanda;
  }
}
