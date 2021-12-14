class Weather {
  String name;
  String imageUrl;
  String imageDisabledUrl;
  String imageBorderUrl;

  Weather({
    required this.name,
    required this.imageUrl,
    required this.imageDisabledUrl,
    required this.imageBorderUrl,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      imageDisabledUrl: json['imageDisabledUrl'] as String,
      imageBorderUrl: json['imageBorderUrl'] as String,
    );
  }
}

final weatherList = [
  Weather(
    name: '비',
    imageUrl: 'assets/images/common/weather/0.png',
    imageDisabledUrl: 'assets/images/common/weather/0_disabled.png',
    imageBorderUrl: 'assets/images/common/weather/0_border.png',
  ),
  Weather(
    name: '흐림',
    imageUrl: 'assets/images/common/weather/1.png',
    imageDisabledUrl: 'assets/images/common/weather/1_disabled.png',
    imageBorderUrl: 'assets/images/common/weather/1_border.png',
  ),
  Weather(
    name: '맑음',
    imageUrl: 'assets/images/common/weather/2.png',
    imageDisabledUrl: 'assets/images/common/weather/2_disabled.png',
    imageBorderUrl: 'assets/images/common/weather/2_border.png',
  ),
  Weather(
    name: '행복',
    imageUrl: 'assets/images/common/weather/3.png',
    imageDisabledUrl: 'assets/images/common/weather/3_disabled.png',
    imageBorderUrl: 'assets/images/common/weather/3_border.png',
  ),
];
