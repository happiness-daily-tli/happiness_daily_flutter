import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:happiness_daily_flutter/models/record.dart';

class RecordTile extends StatelessWidget {
  final Record record;

  const RecordTile({
    Key? key,
    required this.record,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
          CarouselSlider(
            items: record.imageUrl
                .map(
                  (item) => Container(
                    child: Image(
                      height: 335,
                      image: AssetImage(item),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              height: 335,
              initialPage: 0,
              enableInfiniteScroll: false,
              aspectRatio: 2.0,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
