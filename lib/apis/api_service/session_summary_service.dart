import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:smile_care/feautre/feautre.dart';
import 'package:http/http.dart' as http;

class SessionSummaryService {
  static Future<List<SessionSummaryModel>> getSessionInfo(int id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.get('token') ?? 0;
    final response = await http.get(
        Uri.parse(
            '$BASE_URL/profile/patientSessionRelatedWithStudent?student_id=$id'),
        headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200 || response.statusCode == 201) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data
          .map<SessionSummaryModel>(
              (jsonData) => SessionSummaryModel.fromJson(jsonData))
          .toList();
    } else {
      throw Exception('Failed to fetch session summary info');
    }
  }
}
