import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smile_care/apis/apis.dart';
import 'package:smile_care/feautre/feautre.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AuthController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final LocalStorageData localStorageData = Get.put(LocalStorageData());

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool isValidEmail(String email) {
    String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regExp = RegExp(emailPattern);
    return regExp.hasMatch(email);
  }

  void clearData() {
    emailController.clear();
    passwordController.clear();
  }

  Future<void> signInWithEmailAndPassword() async {
    final email = emailController.text;
    final password = passwordController.text;

    try {
      final UserModel userModel =
          await AuthService.signInWithEmailAndPassword(email, password);
      EasyLoading.showSuccess('done...',
          maskType: EasyLoadingMaskType.black,
          duration: const Duration(milliseconds: 500));
      clearData();
      Get.to(const MainScreen());
      setUser(userModel);
      _saveToken(userModel.token.toString());
      _saveID(userModel.id.toString());
    } catch (e) {
      EasyLoading.showError(
        "Wrong login",
        maskType: EasyLoadingMaskType.black,
      );
    }
  }

  Future<void> createAccount() async {
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    try {
      if (confirmPassword != password) {
        throw Exception('Faild Register');
      }
      final UserModel userModel =
          await AuthService.createAccount(email, password);
      EasyLoading.showSuccess('done...',
          maskType: EasyLoadingMaskType.black,
          duration: const Duration(milliseconds: 500));
      clearData();
      Get.to(const MainScreen());
      setUser(userModel);
      _saveToken(userModel.token.toString());
      _saveID(userModel.id.toString());
    } catch (e) {
      EasyLoading.showError(
        "Wrong login",
        maskType: EasyLoadingMaskType.black,
      );
    }
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }

  _saveToken(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    const key = 'token';
    final value = token;
    preferences.setString(key, value);
  }

  _saveID(String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    const key = 'ID';
    final value = id;
    preferences.setString(key, value);
  }
}
