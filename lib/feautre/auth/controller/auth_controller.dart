import 'package:get/get.dart';

class AuthController extends GetxController {
  bool isValidEmail(String email) {
        String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
        RegExp regExp = RegExp(emailPattern);
        return regExp.hasMatch(email);
    }

  bool isValidPassword(String password) {
    const passwordPattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
    final RegExp regex = RegExp(passwordPattern);
    
      return regex.hasMatch(password);
   
    
  }
}
