class CatelogueDetails {
  int? status;
  String? message;
  List<Catalogues>? catalogues;

  CatelogueDetails({this.status, this.message, this.catalogues});

  // factory CatelogueDetails.initial() {
  //   return CatelogueDetails(catalogues: [
  //     Catalogues(name: '', percentN: '', percentP: '', percentK: '')
  //   ]);
  // }
  CatelogueDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['catalogues'] != null) {
      catalogues = <Catalogues>[];
      json['catalogues'].forEach((v) {
        catalogues!.add(Catalogues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.catalogues != null) {
      data['catalogues'] = this.catalogues!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Catalogues {
  int? id;
  String? name;
  String? type;
  String? percentN;
  String? percentP;
  String? percentK;
  int? active;

  Catalogues(
      {this.id,
      this.name,
      this.type,
      this.percentN,
      this.percentP,
      this.percentK,
      this.active});

  Catalogues.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    percentN = json['percent_N'];
    percentP = json['percent_P'];
    percentK = json['percent_K'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['percent_N'] = this.percentN;
    data['percent_P'] = this.percentP;
    data['percent_K'] = this.percentK;
    data['active'] = this.active;
    return data;
  }
}
