// import 'package:todo_app/data/models/todo.dart';
// import 'package:todo_app/data/models/user.dart';
import 'package:todo_app/data/models/post.dart';
import 'package:todo_app/data/network_service.dart';

class Repository {
  final NetworkService networkService;

  Repository({this.networkService});

  Future<List<Post>> fetchPosts() async {
    final todosRaw = await networkService.fetchPosts();
    return todosRaw.map((e) => Post.fromJson(e)).toList();
  }

  Future<bool> changePost(bool isCompleted, int id) async {
    final patchObj = {"isCompleted": isCompleted.toString()};
    return await networkService.patchPost(patchObj, id);
  }

  Future<bool> changeCompletionPost(bool isCompleted, int id) async {
    // final patchObj = {"isCompleted": isCompleted.toString()};
    final patchObj = {
      "title": "1111",
      // "isCompleted": "false",
      "userId": 1,
      "body": "1"
    };
    return await networkService.patchPost(patchObj, id);
  }

  Future<Post> addPost(String message) async {
    final todoObj = {"title": message};
    // final todoObj = {
    //   "title": message,
    //   // "isCompleted": "false",
    //   "userId": 1,
    //   "body": "1"
    // };
    // print(todoObj);
    final todoMap = await networkService.addPost(todoObj);
    if (todoMap == null) return null;

    return Post.fromJson(todoMap);
  }

  Future<bool> deletePost(int id) async {
    return await networkService.deletePost(id);
  }

  Future<bool> updatePost(String message, int id) async {
    final patchObj = {"todo": message};
    return await networkService.patchPost(patchObj, id);
  }
}
