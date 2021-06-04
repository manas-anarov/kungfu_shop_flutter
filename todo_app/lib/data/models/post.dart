class Post {
  int id;
  String body;
  int userId;

  Post.fromJson(Map json)
      : id = json["id"] as int,
        body = json["body"],
        userId = json["userId"] as int;
}
