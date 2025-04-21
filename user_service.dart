import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  static Future<Map<String, dynamic>> fetchRandomUser() async {
    final url = Uri.parse('https://randomuser.me/api/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['results'][0];
    } else {
      throw Exception('Failed to load user');
    }
  }
}
