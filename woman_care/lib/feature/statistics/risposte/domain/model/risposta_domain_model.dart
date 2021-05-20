import 'package:studio_lab/feature/statistics/risposte/data/model/risposta_remote_model.dart';

class RispostaDomainModel {
  String contenuto;
  int idDomanda;

  RispostaDomainModel({
    this.contenuto,
    this.idDomanda,
  });

  RispostaDomainModel.fromRemoteModel(RispostaRemoteModel r) {
    contenuto = r.contenuto;
    idDomanda = r.idDomanda;
  }
}
