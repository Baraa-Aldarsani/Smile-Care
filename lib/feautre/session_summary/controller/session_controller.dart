import 'package:get/get.dart';
import 'package:smile_care/apis/apis.dart';
import 'package:smile_care/feautre/feautre.dart';

class SessionController extends GetxController {
  var sessionInfo = <SessionSummaryModel>[].obs;

  @override
  void onInit() {
    fetchSessionInfo(1);
    super.onInit();
  }

  Future<void> fetchSessionInfo(int id) async {
    try {
      final fetchData = await SessionSummaryService.getSessionInfo(id);
      sessionInfo.assignAll(fetchData);
    } catch (e) {
      print("Error fetch Session Info $e");
    }
  }
}
