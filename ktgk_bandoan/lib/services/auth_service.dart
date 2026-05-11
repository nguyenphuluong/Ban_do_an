import 'dart:convert';

import 'package:http/http.dart'
as http;

class AuthService {

  // ANDROID EMULATOR
  static const String baseUrl =
      "http://10.0.2.2:3000";

  // REAL DEVICE
  // static const String baseUrl =
  // "http://10.15.128.213:3000";

  static Future<Map<String, dynamic>>
  login(
      String username,
      String password,
      ) async {

    final response = await http.post(
      Uri.parse("$baseUrl/login"),

      headers: {
        "Content-Type":
        "application/json",
      },

      body: jsonEncode({
        "username": username,
        "password": password,
      }),
    );

    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>>
  register(
      String username,
      String password,
      ) async {

    final response = await http.post(
      Uri.parse("$baseUrl/register"),

      headers: {
        "Content-Type":
        "application/json",
      },

      body: jsonEncode({
        "username": username,
        "password": password,
      }),
    );

    return jsonDecode(response.body);
  }
}