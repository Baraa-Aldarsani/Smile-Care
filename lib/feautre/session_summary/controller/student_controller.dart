import 'package:get/get.dart';
import 'package:smile_care/apis/apis.dart';
import 'package:smile_care/feautre/feautre.dart';

class StudentController extends GetxController {
  List<StudentModel> studentInfo = [];
  Future<void> getInfoStudent() async {
    try {
      final List<StudentModel> fetchData =
          await SessionSummaryService.getInfoStudentData();
      studentInfo.assignAll(fetchData);
    } catch (e) {
      print("Error : $e");
    }
  }
}
