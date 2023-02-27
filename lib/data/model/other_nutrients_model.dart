class OtherNutrientsDetails {
  int? status;
  String? message;
  late List<OtherNutrients> otherNutrients;

  OtherNutrientsDetails(
      {this.status, this.message, required this.otherNutrients});

  OtherNutrientsDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['otherNutrients'] != null) {
      otherNutrients = <OtherNutrients>[];
      json['otherNutrients'].forEach((v) {
        otherNutrients.add(OtherNutrients.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.otherNutrients != null) {
      data['otherNutrients'] =
          this.otherNutrients.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OtherNutrients {
  int? id;
  late String name;

  OtherNutrients({
    this.id,
    required this.name,
  });

  OtherNutrients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;

    return data;
  }
}
