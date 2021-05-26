class RispostaPossibileRemoteModel {
  int id;
  String contenuto;
  int idDomanda;

  RispostaPossibileRemoteModel({this.id, this.contenuto, this.idDomanda});

  RispostaPossibileRemoteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contenuto = json['contenuto'];
    idDomanda = json['idDomanda'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['contenuto'] = contenuto;
    data['idDomanda'] = idDomanda;
    return data;
  }
}