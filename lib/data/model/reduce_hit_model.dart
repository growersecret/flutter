class Reducehit {
  int? status;
  String? message;
  Data? data;

  Reducehit({this.status, this.message, this.data});

  Reducehit.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? address;
  String? number;
  int? profileSetup;
  int? hitRemaining;
  String? otp;
  String? createdAt;
  String? updatedAt;
  String? freeHit;

  Data(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.number,
      this.profileSetup,
      this.hitRemaining,
      this.otp,
      this.createdAt,
      this.updatedAt,
      this.freeHit});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    address = json['address'];
    number = json['number'];
    profileSetup = json['profile_setup'];
    hitRemaining = json['hit_remaining'];
    otp = json['otp'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    freeHit = json['free_hit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['address'] = this.address;
    data['number'] = this.number;
    data['profile_setup'] = this.profileSetup;
    data['hit_remaining'] = this.hitRemaining;
    data['otp'] = this.otp;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['free_hit'] = this.freeHit;
    return data;
  }
}
