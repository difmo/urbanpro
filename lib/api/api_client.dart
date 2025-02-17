import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  // static const String baseUrl = "https://shikshaappservice.kalln.com/";
  static const String baseUrl = "https://solutiontechs.in/";

  Future<void> _checkInternetConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      throw Exception("No internet connection. Please check your network.");
    }

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isEmpty || result[0].rawAddress.isEmpty) {
        throw Exception("No internet connection. Unable to reach the server.");
      }
    } on SocketException {
      throw Exception("No internet connection. Unable to reach the server.");
    }
  }

  Future<T> post<T>(
    String endpoint,
    Map<String, dynamic> body,
    T Function(Map<String, dynamic> json) fromJson,
  ) async {
    await _checkInternetConnection();

    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        return fromJson(jsonResponse);
      } else {
        throw Exception('Failed to load data: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Network error: Unable to complete POST request. $e');
    }
  }

  Future<dynamic> get(String endpoint,
      {Map<String, String>? queryParameters}) async {
    await _checkInternetConnection();
    try {
      Uri uri = Uri.parse('$baseUrl$endpoint');
      if (queryParameters != null) {
        uri = uri.replace(queryParameters: queryParameters);
      }

      final response = await http.get(
        uri,
        headers: {'Content-Type': 'application/json'},
      );

      return _handleResponse(response);
    } catch (e) {
      throw Exception('Network error: Unable to complete GET request. $e');
    }
  }

  dynamic _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw Exception('Bad Request: ${response.body}');
      case 401:
        throw Exception('Unauthorized: Please check your credentials.');
      case 403:
        throw Exception('Forbidden: Access denied.');
      case 404:
        throw Exception('Not Found: The requested resource was not found.');
      case 500:
        throw Exception('Internal Server Error: Please try again later.');
      default:
        throw Exception(
            'Unexpected Error: ${response.statusCode}, ${response.body}');
    }
  }
}
