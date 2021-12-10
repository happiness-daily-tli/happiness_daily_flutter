class User {
  String name;
  String iconUrl;

  User({
    required this.name,
    required this.iconUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      iconUrl: json['iconUrl'] as String,
    );
  }
}
