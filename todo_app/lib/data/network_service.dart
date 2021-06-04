import 'dart:convert';

import 'package:http/http.dart';

class NetworkService {
  final baseUrl = "http://localhost:3000";
  final usersUrl = "https://jsonplaceholder.typicode.com/users";
  final postsUrl = "https://jsonplaceholder.typicode.com/posts";

  // final baseUrl =
  // "https://gist.githubusercontent.com/manas-anarov/9aee5b78bab6dc532bdb62e9e2c4ad21/raw/02ebe7c9bfc45efec437c3f4b44baa58d743c10e/db.json";

  Future<List<dynamic>> fetchTodos() async {
    try {
      final response = await get(Uri.parse(baseUrl + "/todos"));
      // final response = await get(Uri.parse(baseUrl));
      print(response.body);
      return jsonDecode(response.body) as List;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<dynamic>> fetchPosts() async {
    try {
      final response = await get(Uri.parse(postsUrl));
      print(response.body);
      return jsonDecode(response.body) as List;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<bool> patchPost(Map<String, String> patchObj, int id) async {
    try {
      await patch(Uri.parse(postsUrl + "/$id"), body: patchObj);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Map> addPost(Map<String, String> todoObj) async {
    try {
      final response = await post(Uri.parse(postsUrl), body: todoObj);
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } catch (e) {
      return null;
    }
  }

  Future<bool> deletePost(int id) async {
    try {
      await delete(Uri.parse(postsUrl + "/$id"));
      return true;
    } catch (er) {
      return false;
    }
  }
}
