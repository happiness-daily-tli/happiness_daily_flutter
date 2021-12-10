class Comment {
  Map<String, dynamic> user;
  String content;
  String date;
  int heartCount;

  Comment({
    required this.user,
    required this.content,
    required this.date,
    required this.heartCount,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      user: json['user'] as Map<String, dynamic>,
      content: json['content'] as String,
      date: json['date'] as String,
      heartCount: json['heart'] as int,
    );
  }
}
