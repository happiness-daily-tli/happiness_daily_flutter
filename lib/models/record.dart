class Record {
  String name;
  String content;
  String image;
  String weather;
  String date;
  bool isLock;
  List writer;
  List comment;
  List<String> hashtag;

  Record({
    required this.name,
    required this.content,
    required this.image,
    required this.weather,
    required this.date,
    required this.isLock,
    required this.writer,
    required this.comment,
    required this.hashtag,
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      name: json['name'] ?? String,
      content: json['content'] ?? String,
      image: json['image'] ?? String,
      weather: json['weather'] ?? String,
      date: json['date'] ?? String,
      isLock: json['isLock'] ?? bool,
      writer: json['writer'] ?? List,
      comment: json['comment'] as List,
      hashtag: json['hashtag'].cast<String>() as List<String>,
    );
  }
}
