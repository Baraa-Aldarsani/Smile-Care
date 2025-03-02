class PatientCasesModel {
  int id;
  String details;

  PatientCasesModel({
    required this.id,
    required this.details,
  });

  factory PatientCasesModel.fromJson(Map<dynamic, dynamic> json) {
    return PatientCasesModel(
      id: json['id'],
      details: json['details_of_cases'],
    );
  }
}
