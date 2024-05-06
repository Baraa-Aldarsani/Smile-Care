import 'package:image_picker/image_picker.dart';

class MedicineModel {
  final String name;
  final XFile image;
  MedicineModel({
    required this.name,
    required this.image,
  });
}
