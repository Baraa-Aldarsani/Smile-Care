import 'package:get/get.dart';

class HomeController extends GetxController {
  int counter = 0;
  increase() {
    counter < 3 ? counter++ : counter = 0;
    update();
  }

  decrease() {
    counter > 0 ? counter-- : counter = 3;
    update();
  }
  List<String> title = [
    "Booking \nAppointment",
    "Record of \nvisits",
    "My Appoitment",
    "Required materials",
    "Test results",
    "",
  ];
  
}
