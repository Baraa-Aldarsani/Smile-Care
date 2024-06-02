import 'package:smile_care/feautre/feautre.dart';

class SessionSummaryModel {
  DetailsSessionModel detailsSessionModel;
  SupervisorModel supervisorModel;
  ClinicModel clinicModel;
  ReferralModel referralModel;
  SessionSummaryModel({
    required this.detailsSessionModel,
    required this.supervisorModel,
    required this.clinicModel,
    required this.referralModel,
  });

  factory SessionSummaryModel.fromJson(Map<String, dynamic> json) {
    return SessionSummaryModel(
      detailsSessionModel: DetailsSessionModel.fromJson(json),
      supervisorModel: SupervisorModel.fromJson(json['supervisor']),
      clinicModel: ClinicModel.fromJson(json['clinics']),
      referralModel: ReferralModel.fromJson(json['referrals']),
    );
  }
}
