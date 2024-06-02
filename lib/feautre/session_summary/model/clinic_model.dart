import 'package:smile_care/feautre/feautre.dart';

class ClinicModel {
  int id;
  int number;
  SectionModel sectionModel;
  ClinicModel({
    required this.id,
    required this.number,
    required this.sectionModel,
  });

  factory ClinicModel.fromJson(Map<String, dynamic> json) {
    return ClinicModel(
      id: json['id'],
      number: json['number'],
      sectionModel: SectionModel.fromJson(json['sections']),
    );
  }
}
