class ArchiveAppModel {
  final int id;
  final String date;
  final String time;
  ArchiveAppModel({
    required this.id,
    required this.date,
    required this.time,
  });

  factory ArchiveAppModel.fromJson(Map<String, dynamic> json) {
    return ArchiveAppModel(
      id: json['id'],
      date: json['date'],
      // time: json['deleted_at'],
      time: json['timeDiagnosis'],
    );
  }
}
