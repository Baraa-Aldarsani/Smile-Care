class ProfileModel {
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? birthday;
  String? image;
  ProfileModel({
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.birthday,
    this.image,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      gender: json['gender'],
      birthday: json['birthday'],
      image: json['image'],
    );
  }
}
