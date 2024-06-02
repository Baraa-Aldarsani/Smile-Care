class SectionModel {
  int id;
  String name;
  String image;
  String details;
  SectionModel({
    required this.id,
    required this.name,
    required this.image,
    required this.details,
  });

  factory SectionModel.fromJson(Map<dynamic, dynamic> json) {
    return SectionModel(
      id: json['id'],
      name: json['name'],
      image: json['section_image'],
      details: json['details'],
    );
  }
}
