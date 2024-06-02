import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:smile_care/feautre/feautre.dart';

class HomeService {
  static Future<void> bookAppointment(String reason) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.get('token') ?? 0;
    final response = await http.post(
      Uri.parse('$BASE_URL/profile/bookAppointment'),
      headers: {'Authorization': 'Bearer $token'},
      body: {"reason": reason},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("success booking appointment");
    } else {
      throw Exception('Failed to booking appointment');
    }
  }

  static Future<List<SessionSummaryModel>> fetchDataMyAppointment() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.get('token') ?? 0;
    final response = await http.get(
        Uri.parse('$BASE_URL/profile/myAppointment'),
        headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200 || response.statusCode == 201) {
      final List<dynamic> data = json.decode(response.body)['data']['sessions'];
      return data
          .map<SessionSummaryModel>(
              (jsonData) => SessionSummaryModel.fromJson(jsonData))
          .toList();
    } else {
      throw Exception('Failed to fetch session summary info');
    }
  }
}
