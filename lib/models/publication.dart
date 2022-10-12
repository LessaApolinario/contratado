class Publication {
  String? username;
  String? description;
  String? phone;
  String? email;
  String? userDescription;

  Publication(
      {this.username,
      this.description,
      this.phone,
      this.email,
      this.userDescription});

  Publication.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    description = json['description'];
    phone = json['phone'];
    email = json['email'];
    userDescription = json['user_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['description'] = this.description;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['user_description'] = this.userDescription;
    return data;
  }
}
