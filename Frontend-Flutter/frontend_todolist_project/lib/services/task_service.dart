import 'dart:convert';
import 'package:http/http.dart' as http;

class TaskService {
  static Future<bool> deleteById(int id) async {
    // Delete the item by id
    final url = 'http://192.168.1.108:8080/tasks/$id';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);

    return response.statusCode == 200;
  }

  static Future<List?> fetchTodo() async {
    final url = 'http://192.168.1.108:8080/tasks';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List; // Parse as List
      return json;
    } else {
      return null;
    }
  }

  static Future<bool> updateTask(int id, Map body) async {
    
    final url = 'http://192.168.1.108:8080/tasks/${id}';
    final uri = Uri.parse(url);
    final response = await http.put(uri,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});

    return response.statusCode == 200;
  }

  static Future<bool> createTask(Map body) async {
    final url = 'http://192.168.1.108:8080/tasks';
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
    return response.statusCode == 200;
  }
}
