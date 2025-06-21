import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthRequests {
  String baseUrl = 'http://localhost:8082/api/';
  Future<bool> loginRequest({
    required String email,
    required String password,
  }) async {
    final FlutterSecureStorage storage = const FlutterSecureStorage();
    final url = Uri.parse('${baseUrl}auth/login');
    String encodedPassword = Uri.encodeComponent(password);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': email, 'password': encodedPassword}),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final String token = responseData['token'];
      await storage.write(key: 'token', value: token);
      print('Login successful: $token');
      return true;
    } else {
      final error = jsonDecode(response.body);
      print('Login failed: ${error['message']}');
      return false;
    }
  }

  Future<http.Response> registerRequest({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    final FlutterSecureStorage storage = const FlutterSecureStorage();
    final url = Uri.parse('${baseUrl}auth/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "email": email,
        "password": password,
        "firstName": firstName,
        "lastName": lastName,
      }),
    );
    print(response.body);
    return response;

    // if (response.statusCode == 200) {
    //   final Map<String, dynamic> responseData = json.decode(response.body);
    //
    //   final String token = responseData['token'];
    //   await storage.write(key: 'token', value: token);
    //   print('Login successful: $token');
    //   return true;
    // } else {
    //   final error = jsonDecode(response.body);
    //   print('Login failed: ${error['message']}');
    //   return false;
    // }
  }
}
