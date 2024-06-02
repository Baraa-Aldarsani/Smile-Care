// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smile_care/feautre/feautre.dart';
import 'package:http/http.dart' as http;

class ProfileService {
  static Future<ProfileModel> getUserInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.get('token') ?? 0;
    final response = await http.get(
        Uri.parse('$BASE_URL/profile/showProfileInfo'),
        headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonData = json.decode(response.body)['data'];
      return ProfileModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch user data');
    }
  }

  static Future<ProfileModel> updateUserInfo(
      ProfileModel profileModel, File? imageFile) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.get('token') ?? 0;
    final request =
        http.MultipartRequest('POST', Uri.parse('$BASE_URL/profile/create'));
    request.headers['Authorization'] = 'Bearer $token';
    request.fields['first_name'] = profileModel.firstName!;
    request.fields['last_name'] = profileModel.lastName!;
    request.fields['gender'] = profileModel.gender!;
    request.fields['birthday'] = profileModel.birthday!;

    if (imageFile != null) {
      var stream =
          http.ByteStream(DelegatingStream.typed(imageFile.openRead()));

      var length = await imageFile.length();
      var multipartFile = http.MultipartFile('image_av', stream, length,
          filename: 'image_av$length.png');

      request.files.add(multipartFile);
    }
    final response = await request.send();
    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseData = await response.stream.bytesToString();
      final parsedData = jsonDecode(responseData)['data'];
      return ProfileModel.fromJson(parsedData);
    } else {
      throw Exception('Faild update user info');
    }
  }
}
