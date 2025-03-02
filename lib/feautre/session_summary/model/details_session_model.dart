class DetailsSessionModel {
  int id;
  int evaluation;
  String supervisorNotes;
  String history;
  String studentNotes;
  String statusOfSession;
  String time;
  DetailsSessionModel({
    required this.id,
    required this.evaluation,
    required this.supervisorNotes,
    required this.history,
    required this.studentNotes,
    required this.statusOfSession,
    required this.time,
  });

  factory DetailsSessionModel.fromJson(Map<String, dynamic> json) {
    return DetailsSessionModel(
      id: json['id'],
      evaluation: (json['supervisor_evaluation'] != null)
          ? json['supervisor_evaluation']
          : 0,
      supervisorNotes:
          (json['supervisor_notes'] != null) ? json['supervisor_notes'] : '',
      history: json['history'],
      studentNotes:
          (json['student_notes'] != null) ? json['student_notes'] : '',
      statusOfSession: json['status_of_session'],
      time: json['timeSession'],
    );
  }
}
