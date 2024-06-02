import 'package:smile_care/feautre/health_record/health_record.dart';

class HealthRecordModel {
  List<RadiographsModel>? radiographs;
  List<GetMedicineModel>? medicine;
  List<DiseasesModel>? diseases;

  HealthRecordModel({
    this.radiographs,
    this.medicine,
    this.diseases,
  });

  factory HealthRecordModel.fromJson(Map<dynamic, dynamic> json) {
    var radioList = json['Patient Radiographs'] as List<dynamic>;
    List<RadiographsModel> radiograph = radioList
        .map((radiographs) => RadiographsModel.fromJson(radiographs))
        .toList();

    var medicineList = json['Patient Medicine'] as List<dynamic>;
    List<GetMedicineModel> medicineData = medicineList
        .map((medicine) => GetMedicineModel.fromJson(medicine))
        .toList();
    var diseList = json['Patient Disease'] as List<dynamic>;
    List<DiseasesModel> diseasesData = diseList
        .map((diseases) => DiseasesModel.fromJson(diseases, healthRecord: 1))
        .toList();
    return HealthRecordModel(
      radiographs: radiograph,
      medicine: medicineData,
      diseases: diseasesData,
    );
  }
}
