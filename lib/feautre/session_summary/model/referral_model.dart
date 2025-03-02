import 'package:smile_care/feautre/feautre.dart';

class ReferralModel {
  int id;
  String type;
  String statusOfReferral;
  String statusDone;
  PatientCasesModel patientCases;

  ReferralModel({
    required this.id,
    required this.type,
    required this.statusOfReferral,
    required this.statusDone,
    required this.patientCases,
  });

  factory ReferralModel.fromJson(Map<dynamic, dynamic> json) {
    return ReferralModel(
      id: json['id'],
      type: json['type_of_refarrals'],
      statusOfReferral: json['status_of_refarrals'],
      statusDone: json['status_done'],
      patientCases: PatientCasesModel.fromJson(json['patient_cases']),
    );
  }
}
