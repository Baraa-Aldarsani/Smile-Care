class SupervisorModel {
  int id;
  String firstName;
  String lastName;
  String gender;
  String type;
  SupervisorModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.type,
  });

  factory SupervisorModel.fromJson(Map<dynamic, dynamic> json) {
    return SupervisorModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      gender: json['gender'],
      type: json['type'],
    );
  }
}
