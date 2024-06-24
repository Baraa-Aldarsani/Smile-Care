class RequiredMaterialModel {
  final String name;
  final String image;
  final String studentFName;
  final String studentLName;

  RequiredMaterialModel({
    required this.name,
    required this.image,
    required this.studentFName,
    required this.studentLName,
  });

  factory RequiredMaterialModel.fromJson(Map<String, dynamic> json) {
    return RequiredMaterialModel(
      name: json['student_laboratory_tools']['details_of_tool'],
      image: json['student_laboratory_tools']['image_tool'],
      studentFName: json['student']['first_name'],
      studentLName: json['student']['last_name'],
    );
  }
}
