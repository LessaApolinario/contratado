class User {
  String? id;
  String? type;
  String? name;
  String? email;
  String? cpf;
  String? password;
  String? phone;
  String? specialty;

  User(
      {this.id,
      this.type,
      this.name,
      this.email,
      this.cpf,
      this.password,
      this.phone,
      this.specialty});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    email = json['email'];
    cpf = json['cpf'];
    password = json['password'];
    phone = json['phone'];
    specialty = json['specialty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['email'] = this.email;
    data['cpf'] = this.cpf;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['specialty'] = this.specialty;
    return data;
  }
}
