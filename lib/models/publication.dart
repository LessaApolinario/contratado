class Publication {
  String? username;
  String? userType;
  String? description;
  String? phone;
  String? email;
  String? userDescription;

  Publication(
      {this.username,
      this.userType,
      this.description,
      this.phone,
      this.email,
      this.userDescription});

  Publication.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    userType = json['user_type'];
    description = json['description'];
    phone = json['phone'];
    email = json['email'];
    userDescription = json['user_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['user_type'] = this.userType;
    data['description'] = this.description;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['user_description'] = this.userDescription;
    return data;
  }
}
