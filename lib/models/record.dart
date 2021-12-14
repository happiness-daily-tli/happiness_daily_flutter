import 'package:happiness_daily_flutter/models/comment.dart';

class Record {
  String id;
  Map<String, dynamic> user;
  String content;
  String weather;
  String date;
  bool isLock;
  bool isHeart;
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
    required this.isHeart,
    required this.heartCount,
    required this.comment,
    required this.imageUrl,
    required this.hashtag,
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      id: json['id'] as String,
      user: json['user'] as Map<String, dynamic>,
      content: json['content'] as String,
      weather: json['weather'] as String,
      date: json['date'] as String,
      isLock: json['isLock'] as bool,
      isHeart: json['isHeart'] as bool,
      heartCount: json['heartCount'] as int,
      comment: json['comment'].cast<Comment>() as List<Comment>,
      imageUrl: json['imageUrl'].cast<String>() as List<String>,
      hashtag: json['hashtag'].cast<String>() as List<String>,
    );
  }
}
