import 'package:flutter/material.dart';
import 'package:studio_lab/feature/statistics/domande/data/model/domanda_remote_model.dart';

class DomandaDomainModel {
  int id;
  String contenuto;
  int idSondaggio;

  DomandaDomainModel({
    @required this.id,
    @required this.contenuto,
    @required this.idSondaggio,
  });

  DomandaDomainModel.fromRemoteModel(DomandaRemoteModel d) {
    id = d.id;
    contenuto = d.contenuto;
    idSondaggio = d.idSondaggio;
  }
}
