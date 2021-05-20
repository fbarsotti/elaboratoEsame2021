class RispostaRemoteModel {
  String contenuto;
  int idDomanda;

  RispostaRemoteModel({this.contenuto, this.idDomanda});

  RispostaRemoteModel.fromJson(Map<String, dynamic> json) {
    contenuto = json['contenuto'];
    idDomanda = json['idDomanda'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contenuto'] = contenuto;
    data['idDomanda'] = idDomanda;
    return data;
  }
}
