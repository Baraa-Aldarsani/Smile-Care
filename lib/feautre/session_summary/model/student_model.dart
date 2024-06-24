class StudentModel {
  final int id;
  final String fName;
  final String lName;
  final String gender;
  final String birthday;
  final String year;
  final String specialization;

  StudentModel({
    required this.id,
    required this.fName,
    required this.lName,
    required this.gender,
    required this.birthday,
    required this.year,
    required this.specialization,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      fName: json['first_name'],
      lName: json['last_name'],
      gender: json['gender'],
      birthday: json['birthday'],
      year: json['year'],
      specialization: json['specialization'] ?? '',
    );
  }
}
