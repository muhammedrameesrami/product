import 'dart:convert';
import 'package:http/http.dart' as http;
import '../services/apiConstant.dart';
import 'package:dio/dio.dart';
class AuthService {
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConstants.login),
        body: {
          'email_phone': email,
          'password': password,
        },
      );
      print('1111111111111111');
print(response.body);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {
          'success': 0,
          'message': 'Login failed: ${response.statusCode}',
        };
      }
    } catch (e) {
      print(e.toString());
      return {
        'success': 0,
        'message': 'Error: ',
      };
    }
  }


Future<Map<String, dynamic>> loginUser({
  required String emailOrPhone,
  required String password,
}) async {
  final dio = Dio();

  const String baseUrl = ApiConstants.baseUrl; 
  final url = "$baseUrl/login";

  try {
    final response = await dio.post(
      url,
      data: {
        "email_phone": emailOrPhone,
        "password": password,
      },
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
    );

    if (response.statusCode == 200) {
      final data = response.data;

      // extract token and id
      final token = data["token"];
      final id = data["id"];

      print("Login successful");
      print("ID: $id");
      print("Token: $token");

      return {
        "success": true,
        "id": id,
        "token": token,
        "data": data,
      };
    }

    return {"success": false, "message": "Error"};
  } catch (e) {
    print("Login error: $e");
    return {"success": false, "message": e.toString()};
  }
}

}
