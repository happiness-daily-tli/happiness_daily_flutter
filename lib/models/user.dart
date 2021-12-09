class User {
  String name;
  String iconUrl;

  User({
    required this.name,
    required this.iconUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['id'] ?? String,
      iconUrl: json['id'] ?? String,
    );
  }
}
