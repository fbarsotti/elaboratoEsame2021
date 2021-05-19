class SondaggioRemoteModel {
  int id;
  String titolo;
  String dataCreazione;
  int idCommittente;

  SondaggioRemoteModel(
      {this.id, this.titolo, this.dataCreazione, this.idCommittente});

  SondaggioRemoteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titolo = json['titolo'];
    dataCreazione = json['dataCreazione'];
    idCommittente = json['idCommittente'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['titolo'] = titolo;
    data['dataCreazione'] = dataCreazione;
    data['idCommittente'] = idCommittente;
    return data;
  }
}
