import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/models/weather.dart';

class RecordTileWeather extends StatelessWidget {
  final String weather;

  const RecordTileWeather({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Weather currentWeather =
        weatherList[weatherList.indexWhere((e) => e.name == weather)];

    return Row(
      children: [
        Image.asset(
          currentWeather.imageUrl,
          height: 20,
          width: 20,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          currentWeather.name,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
