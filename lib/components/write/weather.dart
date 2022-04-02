import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/models/index.dart';

class Weather extends StatefulWidget {
  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  int selectedWeatherIndex = 0;

  @override
  Widget build(BuildContext context) {
    void _onChangeWeatherIndex(int index) {
      setState(() {
        selectedWeatherIndex = index;
      });
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < weatherList.length; i++)
          GestureDetector(
            onTap: () => _onChangeWeatherIndex(i),
            child: Column(
              children: i == selectedWeatherIndex
                  ? [
                      Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          color: Color(0xFFF2F1FF),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            weatherList[i].imageUrl,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                      Text(
                        weatherList[i].name,
                        style: TextStyle(fontSize: 10.0),
                      ),
                    ]
                  : [
                      Container(
                        width: 34,
                        height: 34,
                        child: Center(
                          child: Image.asset(
                            weatherList[i].imageDisabledUrl,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                    ],
            ),
          ),
      ],
    );
  }
}
