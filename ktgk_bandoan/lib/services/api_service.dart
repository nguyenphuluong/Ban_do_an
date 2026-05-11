import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/food.dart';

class ApiService {
  static const String baseUrl =
      "http://10.15.128.213:3000";

  static Future<List<Food>> getFoods() async {
    final response = await http.get(
      Uri.parse("$baseUrl/foods"),
    );

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      return data
          .map((e) => Food.fromJson(e))
          .toList();
    } else {
      throw Exception("Failed");
    }
  }
}