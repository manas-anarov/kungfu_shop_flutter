class User {
  // String todoMessage;
  String username;

  // bool isCompleted;
  int id;

  User.fromJson(Map json)
      // : todoMessage = json["todo"],
      : username = json["username"],
        // isCompleted = json["isCompleted"] == "true",
        id = json["id"] as int;
}
