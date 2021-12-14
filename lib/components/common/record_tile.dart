import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/components/common/record_tile_slider.dart';
import 'package:happiness_daily_flutter/models/record.dart';
import 'package:happiness_daily_flutter/models/weather.dart';
import 'package:intl/intl.dart';

class RecordTile extends StatelessWidget {
  final Record record;

  const RecordTile({
    Key? key,
    required this.record,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataFormat = new DateFormat('yyyy.MM.dd');
    final Weather weather =
        weatherList[weatherList.indexWhere((e) => e.name == record.weather)];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                record.user['iconUrl'],
                width: 32,
                height: 32,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                record.user['name'],
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          RecordTileSlider(
            imageUrl: record.imageUrl,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 43,
                    child: Row(
                      children: [
                        Image.asset(
                          record.isHeart
                              ? 'assets/images/common/icon/heart.png'
                              : 'assets/images/common/icon/heart_disabled.png',
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(record.heartCount.toString()),
                      ],
                    ),
                  ),
                  Container(
                    width: 43,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/common/icon/comment.png',
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(record.comment.length.toString()),
                      ],
                    ),
                  ),
                  Image.asset(
                    record.isLock
                        ? 'assets/images/common/icon/lock.png'
                        : 'assets/images/common/icon/unlock.png',
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
              Image.asset(
                'assets/images/common/icon/more.png',
                width: 20,
                height: 20,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Image.asset(
                weather.imageUrl,
                height: 20,
                width: 20,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                weather.name,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(record.content),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 20,
            child: ListView.separated(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: record.hashtag.length,
              itemBuilder: (context, index) {
                return Text(
                  '#${record.hashtag[index]}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 4);
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            dataFormat.format(DateTime.parse(record.date)),
            style: TextStyle(
              color: Color(0xFF999999),
            ),
          ),
        ],
      ),
    );
  }
}
