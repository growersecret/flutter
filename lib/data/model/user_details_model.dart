class UserDetails {
  int? status;
  String? message;
  late Data data;

  UserDetails({this.status, this.message, required this.data});

  UserDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;

    data['data'] = this.data.toJson();

    return data;
  }
}

class Data {
  int? id;
  late String name;
  late String email;
  late String address;
  late String number;
  int? profileSetup;
  late String hitRemaining;
  String? otp;
  String? freeHit;

  Data(
      {this.id,
      required this.name,
      required this.email,
      required this.address,
      required this.number,
      this.profileSetup,
      required this.hitRemaining,
      this.otp,
      this.freeHit});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] == null ? 'Enter your name' : json['name'];
    email = json['email'];
    address = json['address'] == null ? 'Enter your Address' : json['address'];
    number =
        json['number'] == null ? 'Enter your mobile number' : json['number'];
    profileSetup = json['profile_setup'];
    hitRemaining = json['hit_remaining'];
    otp = json['otp'];
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
    data['free_hit'] = this.freeHit;
    return data;
  }
}
