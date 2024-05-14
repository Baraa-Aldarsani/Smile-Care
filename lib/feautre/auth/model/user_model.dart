class UserModel {
  String? id;
  String? email;
  String? token;

  UserModel({
    this.id,
    this.email,
    this.token,
  });

  factory UserModel.fromJson(Map<dynamic, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      token: json['data']['token'],
    );
  }

  toJson() {
    return {
      'id': id,
      'email': email,
      'token': token,
    };
  }
}
