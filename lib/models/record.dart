import 'package:happiness_daily_flutter/models/comment.dart';
import 'package:happiness_daily_flutter/models/user.dart';

class Record {
  String id;
  List user;
  String content;
  String weather;
  String date;
  bool isLock;
  int heartCount;
  List<Comment> comment;
  List<String> imageUrl;
  List<String> hashtag;

  Record({
    required this.id,
    required this.user,
    required this.content,
    required this.weather,
    required this.date,
    required this.isLock,
    required this.heartCount,
    required this.comment,
    required this.imageUrl,
    required this.hashtag,
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      id: json['id'] ?? String,
      user: json['user'] ?? User,
      content: json['content'] ?? String,
      weather: json['weather'] ?? String,
      date: json['date'] ?? String,
      isLock: json['isLock'] ?? bool,
      heartCount: json['heartCount'] ?? int,
      comment: json['comment'].cast<Comment>() as List<Comment>,
      imageUrl: json['imageUrl'].cast<String>() as List<String>,
      hashtag: json['hashtag'].cast<String>() as List<String>,
    );
  }
}
