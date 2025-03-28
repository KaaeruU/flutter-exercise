import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:esame/object_model.dart';

class ServiceData {
   static Future<List<Objectmodel>> getData() async {
    try {
      final response = await http.get(
        Uri.parse("https://my-json-server.typicode.com/zoelounge/menupizza/projects"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        }
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = jsonDecode(response.body);
        return jsonResponse.map((item) => Objectmodel.fromJson(item)).toList();
      } else {
        print('Error status code: ${response.statusCode}');
        print('Error body: ${response.body}');
        throw Exception("Failed to load data");
      }
    } catch (e) {
      print('Error in getData: $e');
      throw Exception("Failed to load data: $e");
    }
  }
}