//import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:soko_fe/Modals/products.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class Services {
  static Future<List<Products>> getProducts() async {
    try {
      final response =
          await http.get(Uri.parse('http://67.205.140.117/api/products'));
      if (response.statusCode == 200) {
        List<Products> list = parseProducts(response.body);

        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Products> parseProducts(String responseBody) {
    List parsed = (json.decode(responseBody)).cast<Map<String, dynamic>>();
    return parsed.map<Products>((json) => Products.fromJson(json)).toList();
  }
}
