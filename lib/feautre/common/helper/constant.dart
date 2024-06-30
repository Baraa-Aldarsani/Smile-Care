// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

const CHARED_DATA_STORAGE = "user";
// const String BASE_URL = 'http://192.168.43.146:8000/api/patient';
const String BASE_URL = 'http://mohannad007-001-site1.ctempurl.com/api/patient';
String basicAuth =
    'Basic ${base64Encode(utf8.encode('11183902:60-dayfreetrial'))}';

Future<String> tokens() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final token = preferences.get('token') ?? '';
  print(token);
  return token.toString();
}
