class DomandaRemoteModel {
  int id;
  String contenuto;
  int idSondaggio;

  DomandaRemoteModel({this.id, this.contenuto, this.idSondaggio});

  DomandaRemoteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contenuto = json['contenuto'];
    idSondaggio = json['idSondaggio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['contenuto'] = contenuto;
    data['idSondaggio'] = idSondaggio;
    return data;
  }
}
