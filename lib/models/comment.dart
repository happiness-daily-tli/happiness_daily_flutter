import 'package:happiness_daily_flutter/models/user.dart';

class Comment {
  User user;
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
      user: json['user'] ?? User,
      content: json['content'] ?? String,
      date: json['date'] ?? String,
      heartCount: json['heart'] as int,
    );
  }
}
