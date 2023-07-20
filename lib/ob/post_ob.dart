class PostOb {
  int? userId;
  String? title;
  String? body;

  PostOb.fromMap(Map<String, dynamic> map) {
    userId = map['userId'];
    title = map['title'];
    body = map['body'];
  }
}